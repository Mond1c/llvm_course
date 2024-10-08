#include <string>
#include <functional>
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

struct InstructionTracerModPass : public PassInfoMixin<InstructionTracerModPass> {
    FunctionCallee logFunc;
    std::string logFuncName;
    std::function<void(Instruction&, IRBuilder<>&)> handler;

    InstructionTracerModPass(const std::string& logFuncName, std::function<void(Instruction&, IRBuilder<>&)> handler)
        : logFuncName(logFuncName), handler(handler) {}

    PreservedAnalyses run(Module& M, ModuleAnalysisManager& AM) {
        if (M.getName().find("app.c") == std::string::npos) return PreservedAnalyses::all();

        LLVMContext& ctx = M.getContext();
        logFunc = M.getOrInsertFunction(logFuncName, FunctionType::getVoidTy(ctx), PointerType::get(Type::getInt8Ty(ctx), 0));

        for (auto& F : M) {
            if (F.isDeclaration() || F.getName() == logFuncName) continue;

            for (auto& B : F) {
                for (auto& I : B) {
                    if (!isa<PHINode>(&I)) {
                        IRBuilder<> builder(&I);
                        handler(I, builder);
                    }
                }
            }
        }

        return PreservedAnalyses::all();
    }
};

void instructionLogHandler(Instruction& I, IRBuilder<>& builder) {
    std::string opcode = I.getOpcodeName();
    Value* value = builder.CreateGlobalStringPtr(opcode.c_str());
    builder.CreateCall(builder.GetInsertBlock()->getModule()->getOrInsertFunction("logInstruction", 
                 FunctionType::getVoidTy(builder.getContext()), PointerType::get(Type::getInt8Ty(builder.getContext()), 0)), value);
}

void instructionUsageLogHandler(Instruction& I, IRBuilder<>& builder) {
    std::string opcode1 = I.getOpcodeName();
    for (auto* U : I.users()) {
        if (Instruction* operand = dyn_cast<Instruction>(U)) {
            if (!isa<PHINode>(operand)) {
                std::string opcode2 = operand->getOpcodeName();
                Value* value = builder.CreateGlobalStringPtr((opcode2 + " <- " + opcode1).c_str());
                builder.CreateCall(builder.GetInsertBlock()->getModule()->getOrInsertFunction("logUsageInstruction", 
                    FunctionType::getVoidTy(builder.getContext()), PointerType::get(Type::getInt8Ty(builder.getContext()), 0)), value);
            }
        }
    }
}

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder& PB) {
         PB.registerOptimizerLastEPCallback([&](ModulePassManager& MPM, auto) {
            MPM.addPass(InstructionTracerModPass("logInstruction", instructionLogHandler));
            return true;
        });

        PB.registerOptimizerLastEPCallback([&](ModulePassManager& MPM, auto) {
            MPM.addPass(InstructionTracerModPass("logUsageInstruction", instructionUsageLogHandler));
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, "InstructionTracerPlugin", "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
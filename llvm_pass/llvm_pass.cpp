#include <string>
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

struct InstructionTracerModPass : public PassInfoMixin<InstructionTracerModPass> {
    FunctionCallee logFunc;


    PreservedAnalyses run(Module& M, ModuleAnalysisManager &AM) {
        if (M.getName().find("app.c") == std::string::npos) return PreservedAnalyses::all();
        outs() << M.getName() << "\n";
        LLVMContext& ctx = M.getContext();
        logFunc = M.getOrInsertFunction("logInstruction", FunctionType::getVoidTy(ctx), PointerType::get(Type::getInt8Ty(ctx), 0));

        for (auto& F : M) {
            if (F.isDeclaration() || F.getName() == "logInstruction") continue;
            for (auto& B : F) {
                for (auto& I : B) {
                    if (!isa<PHINode>(&I)) {
                        IRBuilder<> builder(&I);
                        std::string opcode = I.getOpcodeName();
                        Value* value = builder.CreateGlobalStringPtr(opcode.c_str());
                        builder.CreateCall(logFunc, value);
                    }
                }
            }
        }

        return PreservedAnalyses::all();
    }
};

struct InstructionUsesTracerModPass : public PassInfoMixin<InstructionUsesTracerModPass> {
    FunctionCallee logFunc;

    PreservedAnalyses run(Module& M, ModuleAnalysisManager& AM) {
        if (M.getName().find("app.c") == std::string::npos) return PreservedAnalyses::all();
        LLVMContext& ctx = M.getContext();
        logFunc = M.getOrInsertFunction("logUsageInstruction", FunctionType::getVoidTy(ctx), PointerType::get(Type::getInt8Ty(ctx), 0));
        for (auto& F : M) {
            if (F.isDeclaration() || F.getName() == "logUsageInstruction") continue;
            for (auto& B : F) {
                for (auto& I : B) {
                    if (!isa<PHINode>(&I)) {
                        std::string opcode1 = I.getOpcodeName();
                        for (auto* U : I.users()) {
                            if (Instruction* operand = dyn_cast<Instruction>(U)) {
                                if (!isa<PHINode>(operand)) {
                                    IRBuilder<> builder(&I);
                                    std::string opcode2 = operand->getOpcodeName();
                                    Value* value = builder.CreateGlobalStringPtr((opcode2 + " <- " + opcode1).c_str());
                                    builder.CreateCall(logFunc, value);
                                }
                            }
                        }   
                    }
                }
            }
        }

        return PreservedAnalyses::all();
    }
};

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder& PB) {
         PB.registerOptimizerLastEPCallback([&](ModulePassManager& MPM, auto) {
            MPM.addPass(InstructionTracerModPass{});
            return true;
        });

        PB.registerOptimizerLastEPCallback([&](ModulePassManager& MPM, auto) {
            MPM.addPass(InstructionUsesTracerModPass{});
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, "InstructionUsesTracerPlugin", "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
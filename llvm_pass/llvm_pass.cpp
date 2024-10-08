#include <unordered_map>
#include <algorithm>
#include <string>
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

struct InstructionTracerModPass : public PassInfoMixin<InstructionTracerModPass> {
    FunctionCallee logFunc;


    PreservedAnalyses run(Module& M, ModuleAnalysisManager &AM) {
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

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder& PB) {
        PB.registerOptimizerLastEPCallback([&](ModulePassManager& MPM, auto) {
            MPM.addPass(InstructionTracerModPass{});
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, "InstructionTracerPlugin", "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
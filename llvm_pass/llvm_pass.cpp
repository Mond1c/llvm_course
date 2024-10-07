#include <unordered_map>
#include <string>
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

struct InstructionTracerModPass : public PassInfoMixin<InstructionTracerModPass> {
    PreservedAnalyses run(Module& M, ModuleAnalysisManager &AM) {
        outs() << "[Module] " << M.getName() << "\n";
        std::unordered_map<std::string, int> stats;
        
        for (auto& F : M) {
            if (F.isDeclaration()) continue;
            for (auto& B : F) {
                for (auto& I : B) {
                    if (!isa<PHINode>(&I)) {
                        stats[I.getOpcodeName()]++;
                    }
                }
            }
        }

        outs() << "[STATS]" << "\n";
        for (const auto& item : stats) {
            outs() << item.first << ": " << item.second << "\n";
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


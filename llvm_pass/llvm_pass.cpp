#include <unordered_map>
#include <algorithm>
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
        if (M.getName().find("app.c") == std::string::npos) {
            outs() << "SKIPPED" << "\n";
            return PreservedAnalyses::all();
        }
        std::unordered_map<std::string, int> stats;
        std::vector<std::string> instructions;

        for (auto& F : M) {
            if (F.isDeclaration()) continue;
            for (auto& B : F) {
                for (auto& I : B) {
                    if (!isa<PHINode>(&I)) {
                        stats[I.getOpcodeName()]++;
                        instructions.push_back(I.getOpcodeName());
                    }
                }
            }
        }

        std::vector<std::pair<std::string, int>> s(stats.begin(), stats.end());
        std::sort(s.begin(), s.end(), [](const auto& lhs, const auto& rhs) {
                return lhs.second > rhs.second;
                });

        outs() << "[STATS]" << "\n";
        for (const auto& item : s) {
            outs() << item.first << ": " << item.second << "\n";
        }

        // Patterns
        
        std::unordered_map<std::string, int> patterns;

        for (int i = 0; i < instructions.size(); i++) {
            std::string instr = instructions[i];
            patterns[instr]++;

            if (i > 0) {
                instr = instructions[i - 1] + " " + instr;
                patterns[instr]++;
            }
            if (i - 1 > 0) {
                instr = instructions[i - 2] + " " + instr;
                patterns[instr]++;
            }
            if (i - 2 > 0) {
                instr = instructions[i - 3] + " " + instr;
                patterns[instr]++;
            }
            if (i - 3 > 0) {
                instr = instructions[i - 4] + " " + instr;
                patterns[instr]++;
            }
        }

        std::vector<std::pair<std::string, int>> p(patterns.begin(), patterns.end());
        std::sort(p.begin(), p.end(), [](const auto& lhs, const auto& rhs) {
                return lhs.second > rhs.second;
        });

        outs() << "[PATTERNS]" << "\n";
        for (const auto& item : p) {
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


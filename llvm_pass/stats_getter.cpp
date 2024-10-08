#include <iostream>
#include <fstream>
#include <algorithm>
#include <unordered_map>
#include <vector>
#include <deque>

const int MAX_PATTERN_LENGTH = 5;
const int MIN_PATTERN_FREQ = 4;

void get_stat(const std::string& inputFile, const std::string& outputFile, bool pattern_enable = true) {
    std::ifstream input(inputFile);
    std::ofstream output(outputFile);


    if (!input.is_open()) {
        std::cerr << "can't open " << inputFile << "\n";
        return;
    }

    if (!output.is_open()) {
        std::cerr << "can't open " << outputFile << "\n";
        return;
    }

    std::unordered_map<std::string, std::size_t> stats;
    std::unordered_map<std::string, std::size_t> patterns;

    std::deque<std::string> instructions;
    std::string instruction;

    std::size_t count = 0;

    while (std::getline(input, instruction)) {
        if (count % 1000 == 0) {
            std::cout << "[LOG] COUNT: " << count << "\n";
        }
        stats[instruction]++;
        if (pattern_enable) {
            if (instructions.size() == MAX_PATTERN_LENGTH) {
                instructions.pop_front();
            }
            instructions.push_back(instruction);
            for (std::size_t len = 1; len <= MAX_PATTERN_LENGTH && len <= instruction.size(); ++len) {
                std::string pattern;
                for (int i = instructions.size() - len; i < instructions.size(); i++) {
                    pattern += instructions[i] + (i == instructions.size() - 1 ? "" : " ");
                }
                patterns[pattern]++;
            }
        }
        ++count;
    }
    
    std::vector<std::pair<std::string, std::size_t>> s(stats.begin(), stats.end());
    std::sort(s.begin(), s.end(), [](const auto& lhs, const auto& rhs) {
        return lhs.second > rhs.second;
    });

    output << "[INSTRUCTIONS STATS]\n";
    for (const auto& item : s) {
        if (item.first.empty()) continue;
        output << item.first << ": " << item.second << "\n";
    }

    if (pattern_enable) {
        std::vector<std::pair<std::string, std::size_t>> p(patterns.begin(), patterns.end());
        std::sort(p.begin(), p.end(), [](const auto& lhs, const auto& rhs) {
            return lhs.second > rhs.second;
        });
        
        output << "[PATTERNS STATS]\n";
        for (const auto& item : p) {
            if (item.second < MIN_PATTERN_FREQ) break;
            if (item.first.empty()) continue;
            output << item.first << ": " << item.second << "\n";
        }
    }

    input.close();
    output.close();

    if (input.fail()) {
        std::cerr << "can't close file " << inputFile << "\n";
        return;
    }
    if (output.fail()) {
        std::cerr << "can't close file " << outputFile << "\n";
    }
}

int main() {
    get_stat("instructions.log", "stats_output.txt");
    get_stat("instructions_uses.log", "stats_uses_output.txt", false);
    return 0;
}
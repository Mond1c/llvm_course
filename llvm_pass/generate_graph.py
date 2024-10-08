import matplotlib.pyplot as plt

def load_stats_from_file(filename):
    instruction_stats = {}
    pattern_stats = {}
    current_section = None
    
    with open(filename, 'r') as f:
        for line in f:
            line = line.strip()
            if line == "[INSTRUCTIONS STATS]":
                current_section = "instructions"
            elif line == "[PATTERNS STATS]":
                current_section = "patterns"
            elif line: 
                key, value = line.split(': ')
                if current_section == "instructions":
                    instruction_stats[key] = int(value)
                elif current_section == "patterns":
                    pattern_stats[key] = int(value)
    
    return instruction_stats, pattern_stats

instruction_stats, pattern_stats = load_stats_from_file('../build/stats_output.txt')

plt.figure(figsize=(10, 6))
plt.bar(instruction_stats.keys(), instruction_stats.values(), color='skyblue')
plt.title('Instruction Stats')
plt.xlabel('Instruction')
plt.ylabel('Frequency')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('instruction_stats.png') 

plt.figure(figsize=(14, 8))
top_patterns = dict(list(pattern_stats.items())[:10]) 
plt.bar(top_patterns.keys(), top_patterns.values(), color='lightgreen')
plt.title('Top 10 Patterns Stats')
plt.xlabel('Patterns')
plt.ylabel('Frequency')
plt.xticks(rotation=90)
plt.tight_layout()
plt.savefig('pattern_stats.png') 

instruction_stats, pattern_stats = load_stats_from_file('../build/stats_uses_output.txt')
plt.figure(figsize=(10, 6))
plt.bar(instruction_stats.keys(), instruction_stats.values(), color='skyblue')
plt.title('Instruction Stats')
plt.xlabel('Instruction')
plt.ylabel('Frequency')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('instruction_uses_stats.png') 

plt.show()
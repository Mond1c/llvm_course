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

def plot_bar_with_percent(ax, stats, title, xlabel, ylabel, filename):
    total = sum(stats.values())
    keys = list(stats.keys())
    values = list(stats.values())
    
    bars = ax.bar(keys, values, color='skyblue')

    for bar, value in zip(bars, values):
        percent = (value / total) * 100
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height(), f'{percent:.2f}%', ha='center', va='bottom')

    ax.set_title(title)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_xticklabels(keys, rotation=45, ha='right')

instruction_stats, pattern_stats = load_stats_from_file('../build/stats_output.txt')

fig, ax = plt.subplots(figsize=(10, 6))
plot_bar_with_percent(ax, instruction_stats, 'Instruction Stats', 'Instruction', 'Frequency', 'instruction_stats.png')
plt.tight_layout()
plt.savefig('instruction_stats.png')

top_patterns = dict(list(pattern_stats.items())[:10])

fig, ax = plt.subplots(figsize=(14, 8))
plot_bar_with_percent(ax, top_patterns, 'Top 10 Patterns Stats', 'Patterns', 'Frequency', 'pattern_stats.png')
plt.tight_layout()
plt.savefig('pattern_stats.png')

instruction_stats, pattern_stats = load_stats_from_file('../build/stats_uses_output.txt')

fig, ax = plt.subplots(figsize=(10, 6))
plot_bar_with_percent(ax, instruction_stats, 'Instruction Uses Stats', 'Instruction', 'Frequency', 'instruction_uses_stats.png')
plt.tight_layout()
plt.savefig('instruction_uses_stats.png')

plt.show()
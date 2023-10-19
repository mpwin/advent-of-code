import re

stacks = {k: [] for k in range(1, 10)}

with open("input.txt") as f:
    for line in f:
        # Get input.
        if re.search(r'\[\D\]', line):
            line = line[1::4]
            for index, char in enumerate(line, start=1):
                if char.isupper():
                    stacks[index].insert(0, char)
            continue

        # Move crates.
        m = re.match(r'move (\d+) from (\d+) to (\d+)', line) 
        if m:
            quantity, fm, to = map(int, m.groups())
            for i in range(quantity):
                crate = stacks[fm].pop()
                stacks[to].append(crate)

for i in range(1, 10):
    print(stacks[i][-1], end='')

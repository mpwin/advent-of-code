import re

nice_count: int = 0

def rule_1(line: str) -> bool:
    return len(re.findall(r'[aeiou]', line)) >= 3

def rule_2(line: str) -> bool:
    return re.search(r'(.)\1', line) is not None

def rule_3(line: str) -> bool:
    return re.search(r'ab|cd|pq|xy', line) is None

with open("input.txt") as f:
    for line in f:
        line: str = line.strip()

        if rule_1(line) and rule_2(line) and rule_3(line):
            nice_count += 1

print(nice_count)

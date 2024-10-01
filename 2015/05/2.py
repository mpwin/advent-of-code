import re

nice_count: int = 0

def rule_1(line: str) -> bool:
    return re.search(r'(..).*\1', line) is not None

def rule_2(line: str) -> bool:
    return re.search(r'(.).\1', line) is not None

with open("input.txt") as f:
    for line in f:
        line: str = line.strip()

        if rule_1(line) and rule_2(line):
            nice_count += 1

print(nice_count)

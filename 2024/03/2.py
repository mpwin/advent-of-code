import re

with open("input.txt") as f:
    puzzle_input = f.read()

regex = re.compile(r"do\(\)|don't\(\)|mul\((\d{1,3}),(\d{1,3})\)")
mul_enabled = True
answer = 0

for regex_match in regex.finditer(puzzle_input):
    instruction = regex_match.group(0)

    if instruction == "do()":
        mul_enabled = True
    elif instruction == "don't()":
        mul_enabled = False
    else:
        if mul_enabled:
            answer += int(regex_match.group(1)) * int(regex_match.group(2))

print("Answer:", answer)

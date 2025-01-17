import re

with open("input.txt") as f:
    puzzle_input = f.read()

regex = re.compile(r"mul\((\d{1,3}),(\d{1,3})\)")
answer = sum(int(n1) * int(n2) for n1, n2 in regex.findall(puzzle_input))

print("Answer:", answer)

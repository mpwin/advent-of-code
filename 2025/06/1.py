from math import prod

with open("input.txt") as f:
    lines = [line.split() for line in f]
    problems = {index: list(column) for index, column in enumerate(zip(*lines))}

answer = 0

for problem in problems.values():
    operation = problem.pop()
    if operation == '+':
        answer += sum(map(int, problem))
    if operation == '*':
        answer += prod(map(int, problem))

print(answer)

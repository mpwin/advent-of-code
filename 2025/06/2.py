from collections import defaultdict
from itertools import zip_longest
from math import prod

with open("input.txt") as f:
    problems = defaultdict(list)
    problem_index = 0

    lines = [list(line.rstrip()) for line in f]
    for column in zip_longest(*lines, fillvalue=' '):
        if all(item.isspace() for item in column):
            problem_index += 1
        else:
            problems[problem_index].append(list(column))

answer = 0

for problem in problems.values():
    operation = problem[0].pop()
    if operation == '+':
        answer += sum(int(''.join(column)) for column in problem)
    if operation == '*':
        answer += prod(int(''.join(column)) for column in problem)

print(answer)

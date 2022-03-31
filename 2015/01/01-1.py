# Python 3.10

floor = 0

with open('input.txt') as input:
    for char in input.read():
        match char:
            case '(': floor += 1
            case ')': floor -= 1

print(floor)

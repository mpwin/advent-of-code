# Python 3.10

floor = 0

with open('input.txt') as input:
    for position, char in enumerate(input.read()):
        match char:
            case '(': floor += 1
            case ')': floor -= 1

        if floor < 0:
            print(position + 1)
            break

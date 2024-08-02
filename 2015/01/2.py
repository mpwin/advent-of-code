floor: int = 0
move: dict = {'(': 1, ')': -1}

with open("input.txt") as f:
    char_iter = iter(lambda: f.read(1), '')
    for position, char in enumerate(char_iter, start=1):
        floor += move[char]
        if floor == -1:
            print(position)
            break

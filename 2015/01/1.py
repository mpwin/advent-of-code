floor: int = 0
move: dict = {
    '(': 1,
    ')': -1,
    }

with open("input.txt") as f:
    for char in iter(lambda: f.read(1), ''):
        floor += move[char]

print(floor)

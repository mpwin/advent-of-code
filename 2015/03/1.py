santa: complex = 0j
houses: set[complex] = {santa}
moves: dict[str, complex] = {
    '^': 1j,
    'v': -1j,
    '>': 1,
    '<': -1,
    }

with open("input.txt") as f:
    char_iter = iter(lambda: f.read(1), '')

    for char in char_iter:
        santa += moves[char]
        houses.add(santa)

print(len(houses))

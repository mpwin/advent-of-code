santas: list[complex] = [0j, 0j]
houses: set[complex] = {*santas}
moves: dict[str, complex] = {
    '^': 1j,
    'v': -1j,
    '>': 1,
    '<': -1,
    }

with open("input.txt") as f:
    char_iter = iter(lambda: f.read(1), '')

    for index, char in enumerate(char_iter):
        santas[index % 2] += moves[char]
        houses.add(santas[index % 2])

print(len(houses))

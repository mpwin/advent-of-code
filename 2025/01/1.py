with open("input.txt") as f:
    rotations = [(line[0], int(line[1:])) for line in f]

dial = 50
password = 0

for (direction, distance) in rotations:
    if direction == 'L':
        dial = (dial - distance) % 100
    if direction == 'R':
        dial = (dial + distance) % 100

    if dial == 0:
        password += 1

print(password)

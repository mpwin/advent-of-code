from string import ascii_letters

priority = {char: index for index, char in enumerate(ascii_letters, start=1)}
sum = 0

with open("input.txt") as f:
    elves = []
    for line in f:
        elves.append(line.rstrip())
        if len(elves) == 3:
            item = set(elves[0]) & set(elves[1]) & set(elves[2])
            sum += priority[item.pop()]
            elves.clear()

print(sum)

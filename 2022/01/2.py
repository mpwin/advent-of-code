calories = 0
elves = [0, 0, 0]

with open("input.txt") as f:
    for line in f:
        line = line.rstrip()
        if line == "":
            elves.append(calories)
            elves.remove(min(elves))
            calories = 0
        else:
            calories += int(line)

print(sum(elves))

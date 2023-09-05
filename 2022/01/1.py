calories = 0
answer = 0

with open("input.txt") as f:
    for line in f:
        line = line.rstrip()
        if line == "":
            answer = max(calories, answer)
            calories = 0
        else:
            calories += int(line)

print(answer)

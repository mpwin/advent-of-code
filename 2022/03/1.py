from string import ascii_letters

priority = {char: index for index, char in enumerate(ascii_letters, start=1)}
sum = 0

with open("input.txt") as f:
    for line in f:
        line = line.rstrip()
        half = len(line)//2
        item = set(line[:half]) & set(line[half:])
        sum += priority[item.pop()]

print(sum)

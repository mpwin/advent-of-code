with open("input.txt") as f:
    input = f.readline().rstrip()

for i in range(len(input)):
    if len(set(input[i:i+14])) == 14:
        print(i+14)
        break

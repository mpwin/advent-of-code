with open("input.txt") as f:
    input = f.readline().rstrip()

for i in range(len(input)):
    if len(set(input[i:i+4])) == 4:
        print(i+4)
        break

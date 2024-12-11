def safe(ints: list[int]) -> bool:
    if ints[1] - ints[0] > 0:
        valid = [1, 2, 3]
    else:
        valid = [-1, -2, -3]

    for i1, i2 in zip(ints, ints[1:]):
        if i2 - i1 not in valid:
            return False
    return True

answer = 0

with open("input.txt") as f:
    for line in f:
        ints = [int(i) for i in line.split()]

        for i in range(len(ints)):
            if safe(ints[:i] + ints[i+1:]):
                answer += 1
                break

print(answer)

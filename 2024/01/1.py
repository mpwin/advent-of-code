list1 = []
list2 = []

with open("input.txt") as f:
    for line in f:
        int1, int2 = map(int, line.split())
        list1.append(int1)
        list2.append(int2)

answer = sum(abs(i1 - i2) for i1, i2 in zip(sorted(list1), sorted(list2)))

print(answer)

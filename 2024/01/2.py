from collections import defaultdict

list1 = []
list2 = defaultdict(int)

with open("input.txt") as f:
    for line in f:
        int1, int2 = map(int, line.split())
        list1.append(int1)
        list2[int2] += 1

answer = sum(i * list2[i] for i in list1)

print(answer)

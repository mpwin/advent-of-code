from re import findall

answer = 0

with open("input.txt") as f:
    for line in f:
        a1, a2, b1, b2 = [int(m) for m in findall("(\d+)", line)]
        s1 = set(range(a1, a2+1))
        s2 = set(range(b1, b2+1))
        if s1.issubset(s2) or s2.issubset(s1):
            answer += 1

print(answer)

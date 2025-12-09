from itertools import combinations

with open("input.txt") as f:
    banks = [tuple(map(int, line.strip())) for line in f]

joltage_sum = sum(max((n1 * 10 + n2) for n1, n2 in combinations(bank, 2))
                                     for bank in banks)

print(joltage_sum)

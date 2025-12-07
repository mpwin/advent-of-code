import re

with open("input.txt") as f:
    ranges = [tuple(map(int, pair.split('-'))) for pair in f.read().split(',')]

def is_invalid(num: int) -> bool:
    s = str(num)
    for i in range(len(s)//2):
        if re.match(r'^(.{' + str(i+1) + r'})\1+$', s):
            return True
    return False

invalid_ids_sum = 0

for r1, r2 in ranges:
    for num in range(r1, r2 + 1):
        if is_invalid(num):
            invalid_ids_sum += num

print(invalid_ids_sum)

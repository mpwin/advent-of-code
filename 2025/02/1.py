with open("input.txt") as f:
    ranges = [tuple(map(int, pair.split('-'))) for pair in f.read().split(',')]

def is_invalid(num: int) -> bool:
    s = str(num)
    l = len(s)
    if s[:l//2] == s[l//2:]:
        return True
    return False

invalid_ids_sum = 0

for r1, r2 in ranges:
    for num in range(r1, r2 + 1):
        if is_invalid(num):
            invalid_ids_sum += num

print(invalid_ids_sum)

with open("input.txt") as f:
    id_ranges = []
    for line in iter(f.readline, '\n'):
        num1, num2 = map(int, line.strip().split('-'))
        id_ranges.append(range(num1, num2 + 1))

def overlap(r1: range, r2: range) -> bool:
    if r1[0] in r2 or r1[-1] in r2:
        return True
    if r2[0] in r1 or r2[-1] in r1:
        return True
    return False

def merge(r1: range, r2: range) -> range:
    return range(min(r1[0], r2[0]), max(r1[-1], r2[-1]) + 1)

isolated_ranges = set()

while len(id_ranges) > 0:
    r = id_ranges.pop(0)
    merged = False

    for index, id_range in enumerate(id_ranges):
        if overlap(r, id_range):
            id_ranges[index] = merge(r, id_range)
            merged = True
            break

    if not merged:
        isolated_ranges.add(r)

fresh_ids_count = sum(len(r) for r in isolated_ranges)

print(fresh_ids_count)

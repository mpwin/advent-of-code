with open("input.txt") as f:
    grid = {
        (row, col): char
        for row, line in enumerate(f)
        for col, char in enumerate(line.strip())
    }

for key, value in grid.items():
    if value == 'S':
        start = key
        break

splits = set()
visited = set()
queue = [start]

while queue:
    pos = queue.pop(0)

    if pos in visited:
        continue
    if pos not in grid:
        continue

    row, col = pos

    if grid[pos] == '^':
        splits.add(pos)
        queue.append((row, col - 1))
        queue.append((row, col + 1))
    else:
        queue.append((row + 1, col))

    visited.add(pos)

print(len(splits))

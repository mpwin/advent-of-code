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

def timelines(pos: tuple[int, int], grid: dict, visited = None) -> int:
    if visited is None:
        visited = {}

    if pos in visited:
        return visited[pos]
    if pos not in grid:
        return 1

    row, col = pos

    if grid[pos] == '^':
        l = timelines((row, col - 1), grid, visited)
        r = timelines((row, col + 1), grid, visited)
        visited[pos] = l + r
    else:
        visited[pos] = timelines((row + 1, col), grid, visited)

    return visited[pos]

answer = timelines(start, grid)

print(answer)

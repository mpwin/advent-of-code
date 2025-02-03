with open("input.txt") as f:
    grid = [line.rstrip() for line in f]

rows = len(grid)
cols = len(grid[0])

answer = 0

for r in range(1, rows-1):
    for c in range(1, cols-1):
        if grid[r][c] != 'A':
            continue

        ne = grid[r-1][c+1] # Northeast
        nw = grid[r-1][c-1] # Northwest
        se = grid[r+1][c+1] # Southeast
        sw = grid[r+1][c-1] # Southwest

        if ((nw == 'M' and se == 'S') or (nw == 'S' and se == 'M')) \
            and ((ne == 'M' and sw == 'S') or (ne == 'S' and sw == 'M')):
            answer += 1

print("Answer:", answer)

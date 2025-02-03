with open("input.txt") as f:
    grid = [line.rstrip() for line in f]

rows = len(grid)
cols = len(grid[0])

def in_grid(row: int, col: int) -> bool:
    return 0 <= row < rows and 0 <= col < cols

directions = [
    (-1, 0),  # North
    (-1, 1),  # Northeast
    (0, 1),   # East
    (1, 1),   # Southeast
    (1, 0),   # South
    (1, -1),  # Southwest
    (0, -1),  # West
    (-1, -1), # Northwest
    ]

answer = 0

for row in range(rows):
    for col in range(cols):
        if grid[row][col] != 'X':
            continue

        for dr, dc in directions:
            if not in_grid(row + dr*3, col + dc*3):
                continue

            word = [grid[row + dr*i][col + dc*i] for i in range(4)]
            if ''.join(word) == 'XMAS':
                answer += 1

print("Answer:", answer)

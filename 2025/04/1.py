with open("input.txt") as f:
    rolls = set((row, col) for row, line in enumerate(f)
                           for col, char in enumerate(line)
                           if char == '@')

adjacent_positions = (
    (-1, -1), # Northwest
    (-1, 0),  # North
    (-1, 1),  # Northeast
    (0, -1),  # West
    (0, 1),   # East
    (1, -1),  # Southwest
    (1, 0),   # South
    (1, 1),   # Southeast
)

answer = 0

for row, col in rolls:
    adjacent_rolls = sum(1 for r, c in adjacent_positions
                           if (row + r, col + c) in rolls)

    if adjacent_rolls < 4:
        answer += 1

print(answer)

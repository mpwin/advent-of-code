shape = {'X': 1, 'Y': 2, 'Z': 3}
score = 0

with open("input.txt") as f:
    for line in f:
        opponent, player = line.rstrip().split(' ')
        match (opponent, player):
            case ('A', 'Y') | ('B', 'Z') | ('C', 'X'):
                score += 6
            case ('A', 'X') | ('B', 'Y') | ('C', 'Z'):
                score += 3
        score += shape[player]

print(score)

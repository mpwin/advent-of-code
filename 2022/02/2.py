round = {'X': 0, 'Y': 3, 'Z': 6}
score = 0

with open("input.txt") as f:
    for line in f:
        opponent, player = line.rstrip().split(' ')
        match (opponent, player):
            case ('A', 'X') | ('B', 'Z') | ('C', 'Y'):
                score += 3
            case ('A', 'Z') | ('B', 'Y') | ('C', 'X'):
                score += 2
            case ('A', 'Y') | ('B', 'X') | ('C', 'Z'):
                score += 1
        score += round[player]

print(score)

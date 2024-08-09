feet: int = 0

with open("input.txt") as f:
    for line in f:
        l, w, h = map(int, line.split('x'))

        feet += 2*l*w
        feet += 2*w*h
        feet += 2*h*l
        feet += min(l*w, w*h, h*l)

print(feet)

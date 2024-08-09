feet: int = 0

with open("input.txt") as f:
    for line in f:
        l, w, h = map(int, line.split('x'))

        feet += min(l+l+w+w, w+w+h+h, h+h+l+l)
        feet += l*w*h

print(feet)

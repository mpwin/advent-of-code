from itertools import combinations
from math import dist, prod

with open("input.txt") as f:
    boxes = tuple(
        tuple(map(int, line.strip().split(',')))
        for line in f
    )
    circuits = [{i} for i in range(len(boxes))]

distances = {
    (i, j): dist(boxes[i], boxes[j])
    for i, j in combinations(range(len(boxes)), 2)
}
pairings = sorted(distances, key=distances.get)

for box1, box2 in pairings[:1000]:
    circuit1 = None
    circuit2 = None

    for circuit in circuits:
        if box1 in circuit:
            circuit1 = circuit
        if box2 in circuit:
            circuit2 = circuit
        if circuit1 and circuit2:
            break

    if circuit1 is not circuit2:
        circuit1 |= circuit2
        circuits.remove(circuit2)

largest_circuits = sorted(circuits, key=len)[-3:]
answer = prod(len(circuit) for circuit in largest_circuits)

print(answer)

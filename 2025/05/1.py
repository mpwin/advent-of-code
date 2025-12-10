with open("input.txt") as f:
    id_ranges = []
    for line in iter(f.readline, '\n'):
        num1, num2 = map(int, line.strip().split('-'))
        id_ranges.append(range(num1, num2 + 1))
    ingredients = tuple(int(line) for line in f.readlines())

def is_fresh(ingredient: int, id_ranges: list[range]) -> bool:
    for id_range in id_ranges:
        if ingredient in id_range:
            return True
    return False

fresh_ingredients = sum(1 for ingredient in ingredients
                          if is_fresh(ingredient, id_ranges))

print(fresh_ingredients)

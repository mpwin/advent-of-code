from collections import defaultdict

with open("input.txt") as f:
    rules = defaultdict(set)
    for line in iter(f.readline, '\n'):
        num1, num2 = line.strip().split('|')
        rules[num1].add(num2)
    puzzle_input = (line.strip().split(',') for line in f.readlines())

def is_correct(nums: list) -> bool:
    prev_nums = set()
    for num in nums:
        if not rules[num].isdisjoint(prev_nums):
            return False
        prev_nums.add(num)
    return True

def fix_and_get_mid(nums: list) -> int:
    while True:
        prev_nums = set()
        swapped = False
        for i, num in enumerate(nums):
            if not rules[num].isdisjoint(prev_nums):
                nums[i], nums[i-1] = nums[i-1], nums[i]
                swapped = True
            prev_nums.add(num)
        if not swapped:
            return int(nums[len(nums) // 2])

answer = sum(
    fix_and_get_mid(nums)
    for nums in puzzle_input
    if not is_correct(nums)
    )
print("Answer:", answer)

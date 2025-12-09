with open("input.txt") as f:
    banks = [tuple(map(int, line.strip())) for line in f]

def max_joltage(bank: tuple[int, ...]):
    joltage = []
    i = 0
    j = len(bank) - 12

    for _ in range(12):
        bank_slice = bank[i:j+1]
        max_num = max(bank_slice)
        max_num_index = bank_slice.index(max_num)

        joltage.append(str(max_num))
        i += max_num_index + 1
        j += 1

    return int("".join(joltage))

joltage_sum = sum(max_joltage(bank) for bank in banks)

print(joltage_sum)

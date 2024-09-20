import hashlib

puzzle_input: str = "yzbqklnj"
count: int = 0

while True:
    count += 1
    hash_md5 = hashlib.md5((puzzle_input + str(count)).encode())

    if hash_md5.hexdigest().startswith("00000"):
        break

print(count)

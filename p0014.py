'''
Longest Collatz sequence

https://projecteuler.net/problem=14
'''


def sol():
    save = {1 : 1}
    for i in range(1000000, 0, -1):
        collatz(save, i)
    return max(save, key=save.get)


def collatz(save, n):
    if n not in save:
        if n % 2 == 0:
            save[n] = collatz(save, n // 2) + 1
        else:
            save[n] = collatz(save, 3 * n + 1) + 1
    return save[n]


if __name__ == "__main__":
    print(sol())

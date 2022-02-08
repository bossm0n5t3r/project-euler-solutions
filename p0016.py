"""
Power digit sum
Problem 16

https://projecteuler.net/problem=16
"""


def sol():
    print(sum([int(i) for i in str(2 ** 1000)]))


if __name__ == "__main__":
    sol()

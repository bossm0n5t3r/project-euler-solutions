"""
Lattice paths
Problem 15

https://projecteuler.net/problem=15
"""


def sol():
    print(combination(40, 20))


def combination(n, k):
    # Compute C(n, k)
    if 2 * k > n:
        k = n - k
    numerator = 1
    denominator = 1
    while k > 0:
        numerator *= n
        denominator *= k
        n -= 1
        k -= 1
    return numerator // denominator


if __name__ == "__main__":
    sol()

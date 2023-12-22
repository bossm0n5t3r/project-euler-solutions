"""
Maximum Path Sum I
Problem 18

https://projecteuler.net/problem=18
"""


def sol():
    lines = open("resources/p0018.txt", "r").readlines()
    triangle = parse_lines(lines)
    reversed_triangle = list(reversed(triangle))
    for i in range(0, len(reversed_triangle) - 1):
        for j in range(0, len(reversed_triangle[i]) - 1):
            reversed_triangle[i + 1][j] += max(
                reversed_triangle[i][j], reversed_triangle[i][j + 1]
            )
    print(reversed_triangle[-1][0])


def parse_lines(lines: list[str]) -> list[list[int]]:
    return [list(map(int, line.split())) for line in lines]


if __name__ == "__main__":
    sol()

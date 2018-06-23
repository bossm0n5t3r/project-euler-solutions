#  Solution to Project Euler Problem 9

def sol():
    PERIMETER = 1000
    for a in range(1, int(PERIMETER / 3) + 1):
        for c in range(int(PERIMETER / 3) - 1, PERIMETER - 2):
            b = PERIMETER - a - c
            if a * a + b * b == c * c:
                return str(a * b * c)

if __name__ == "__main__":
    print(sol())

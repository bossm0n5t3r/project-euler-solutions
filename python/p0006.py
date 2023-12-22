#  Solution to Project Euler Problem 6

def sol():
    N = 100
    s = sum(i for i in range(1, N + 1))
    s2 = sum(i**2 for i in range(1, N + 1))
    return str(s**2 - s2)

def sol2():
    N = 100
    return ((N**4) // 4) + ((N**3) // 6) - ((N**2) // 4) - (N // 6)

if __name__ == "__main__":
    print(sol())
    #  print(sol2())

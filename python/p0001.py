#  Solution to Project Euler Problem 1

def sol():
    ans = sum(x for x in range(1000) if (x % 3 == 0 or x % 5 == 0))
    return str(ans)

if __name__ == "__main__":
    print(sol())

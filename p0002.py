#  Solution to Project Euler Problem 2

def sol():
    ans = 0
    x = 1
    y = 2
    while x < 4000000:
        if x % 2 == 0:
            ans += x
        x, y = y, x + y
    return str(ans)

if __name__ == "__main__":
    print(sol())

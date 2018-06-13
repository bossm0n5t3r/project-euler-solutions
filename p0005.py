#  Solution to Project Euler Problem 5

def sol():
    ans = 1
    for i in range(1, 21):
        ans *= i // gcd(i, ans)
    return str(ans)

def gcd(a, b):
    while b > 0:
        a, b = b, a % b
    return a

if __name__ == "__main__":
    print(sol())

#  Solution to Project Euler Problem 10

def sol():
    PARAMETER = 2000000
    ans = 0
    for i in range(PARAMETER):
        if is_prime(i):
            ans += i
    return str(ans)

def is_prime(n):
    if n == 1:
        return False
    elif n == 2:
        return True
    elif n % 2 == 0:
        return False
    i = 3
    while i * i <= n:
        if n % i == 0:
            return False
        i += 2
    return True

if __name__ == "__main__":
    print(sol())

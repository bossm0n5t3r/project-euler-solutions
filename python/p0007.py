#  Solution to Project Euler Problem 7

def sol():
    ans = 1
    index = 0
    while index < 10001:
        ans += 1
        if checkPrime(ans):
            index += 1
    return str(ans)

def checkPrime(n):
    i = 2
    if n == i:
        return True
    while i < int(n**.5) + 1:
        if n % i == 0:
            return False
        i += 1
    return True

if __name__ == "__main__":
    print(sol())

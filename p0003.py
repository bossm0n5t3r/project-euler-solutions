#  Solution to Project Euler Problem 3

def sol():
    n = 600851475143
    i = 2
    while i <= n:
        if i < n and n % i == 0:
            n //= i
        i += 1
    return str(n)

if __name__ == "__main__":
    print(sol())

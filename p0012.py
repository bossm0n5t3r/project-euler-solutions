#  Solution to Project Euler Problem 12

def sol():
    ans = 0
    index = 0
    while True:
        index += 1
        ans += index
        if num_of_divisors(ans) > 500:
            return str(ans)

def num_of_divisors(n):
    end = int(n**.5)
    result = sum(2 for i in range(1, end + 1) if n % i == 0)
    if end**2 == n:
        result -= 1
    return result

if __name__ == "__main__":
    print(sol())
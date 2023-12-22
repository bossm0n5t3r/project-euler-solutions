#!/usr/bin/env bash


# INPUT PROBLEM NUMBER
read -p "INPUT PROBLEM NUMBER: " number

# INPUT PROBLEM NAME
read -p "INPUT PROBLEM NAME: " name

# SELECT PROGRAMMING LANGUAGES
echo "SELECT PROGRAMMING LANGUAGES :"
echo "1. Python"
read -p "INPUT NUMBER: " language

if [[ $language -ne 1 ]]; then
  echo "Only acceptable in [1]"
  exit 0
fi

# CREATE py FILE

## Python
if [[ $language -eq 1 ]]; then
  echo "\"\"\"" >> python/p$(printf %04d $number).py
  echo "$name" >> python/p$(printf %04d $number).py
  echo "Problem $number" >> python/p$(printf %04d $number).py
  echo "" >> python/p$(printf %04d $number).py
  echo "https://projecteuler.net/problem=$number" >> python/p$(printf %04d $number).py
  echo "\"\"\"" >> python/p$(printf %04d $number).py
  echo "" >> python/p$(printf %04d $number).py
  echo "" >> python/p$(printf %04d $number).py
  echo "def sol():" >> python/p$(printf %04d $number).py
  echo "    print(\"hello\")" >> python/p$(printf %04d $number).py
  echo "" >> python/p$(printf %04d $number).py
  echo "" >> python/p$(printf %04d $number).py
  echo "if __name__ == \"__main__\":" >> python/p$(printf %04d $number).py
  echo "    sol()" >> python/p$(printf %04d $number).py
fi

echo "DONE! LET'S SOLVE THE PROBLEM! - $name"

exit 0

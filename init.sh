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
  echo "\"\"\"" >> p$(printf %04d $number).py
  echo "$name" >> p$(printf %04d $number).py
  echo "Problem $number" >> p$(printf %04d $number).py
  echo "" >> p$(printf %04d $number).py
  echo "https://projecteuler.net/problem=$number" >> p$(printf %04d $number).py
  echo "\"\"\"" >> p$(printf %04d $number).py
  echo "" >> p$(printf %04d $number).py
  echo "" >> p$(printf %04d $number).py
  echo "def sol():" >> p$(printf %04d $number).py
  echo "    print(\"hello\")" >> p$(printf %04d $number).py
  echo "" >> p$(printf %04d $number).py
  echo "" >> p$(printf %04d $number).py
  echo "if __name__ == \"__main__\":" >> p$(printf %04d $number).py
  echo "    sol()" >> p$(printf %04d $number).py
fi

echo "DONE! LET'S SOLVE THE PROBLEM! - $name"

exit 0

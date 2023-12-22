#!/usr/bin/env bash


# INPUT PROBLEM NUMBER
read -p "INPUT PROBLEM NUMBER: " number

# INPUT PROBLEM NAME
read -p "INPUT PROBLEM NAME: " name

# SELECT PROGRAMMING LANGUAGES
echo "SELECT PROGRAMMING LANGUAGES :"
echo "1. Python"
echo "2. Elixir"
read -p "INPUT NUMBER: " language

if [[ $language -ne 1 ]] && [[ $language -ne 2 ]]; then
  echo "Only acceptable in [1]"
  exit 0
fi

# CREATE FILE

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

## Elixir
if [[ $language -eq 2 ]]; then
  echo "defmodule P$(printf %04d $number) do" >> elixir/p$(printf %04d $number).ex
  echo "  @moduledoc \"\"\"" >> elixir/p$(printf %04d $number).ex
  echo "  $name" >> elixir/p$(printf %04d $number).ex
  echo "  Problem $number" >> elixir/p$(printf %04d $number).ex
  echo "" >> elixir/p$(printf %04d $number).ex
  echo "  https://projecteuler.net/problem=$number" >> elixir/p$(printf %04d $number).ex
  echo "  \"\"\"" >> elixir/p$(printf %04d $number).ex
  echo "" >> elixir/p$(printf %04d $number).ex
  echo "  def solve() do" >> elixir/p$(printf %04d $number).ex
  echo "    IO.puts(\"hello\")" >> elixir/p$(printf %04d $number).ex
  echo "  end" >> elixir/p$(printf %04d $number).ex
  echo "end" >> elixir/p$(printf %04d $number).ex
  echo "" >> elixir/p$(printf %04d $number).ex
  echo "P$(printf %04d $number).solve()" >> elixir/p$(printf %04d $number).ex
fi

echo "DONE! LET'S SOLVE THE PROBLEM! - $name"

exit 0

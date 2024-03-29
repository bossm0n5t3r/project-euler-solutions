defmodule Mathematics do
  def gcd(a, b) when b > 0, do: gcd(b, rem(a, b))
  def gcd(a, 0), do: a

  def lcm(a, b), do: div(a * b, gcd(a, b))

  def is_prime?(num) when num <= 1, do: false

  def is_prime?(num) do
    if num == 2 or num == 3 do
      true
    else
      Enum.all?(2..trunc(:math.sqrt(num)), fn x -> rem(num, x) != 0 end)
    end
  end

  def factorial(n) when n > 1 do
    n * factorial(n - 1)
  end

  def factorial(1), do: 1

  def factorial(0), do: 1

  def combination(n, r), do: div(factorial(n), factorial(r) * factorial(n - r))

  def get_sum_of_proper_divisors(num) when num == 1, do: 0

  def get_sum_of_proper_divisors(num) do
    root = trunc(:math.sqrt(num))

    1..root
    |> Enum.reduce(0, fn x, acc ->
      if rem(num, x) == 0 do
        if x == 1 or (x == root and root * root == num) do
          acc + x
        else
          acc + x + div(num, x)
        end
      else
        acc
      end
    end)
  end

  def get_all_permutations([]) do
    [[]]
  end

  def get_all_permutations(list) do
    for h <- list, t <- get_all_permutations(list -- [h]), do: [h | t]
  end

  def fib() do
    Stream.unfold({0, 1}, fn {current, next} ->
      {current, {next, current + next}}
    end)
  end

  def is_composite?(num) when num <= 1, do: false

  def is_composite?(num) do
    !is_prime?(num)
  end

  def is_palindrome?(number) when is_number(number) do
    Integer.to_string(number) == Integer.to_string(number) |> String.reverse()
  end
end

defmodule P0012 do
  @moduledoc """
  Highly Divisible Triangular Number
  Problem 12

  https://projecteuler.net/problem=12
  """

  def solve() do
    triangle_number_that_has_more_than_n_factors(1, 500)
  end

  def triangle_number_that_has_more_than_n_factors(num, n) do
    triangle_number = div(num * (num + 1), 2)
    factors = number_of_factors(triangle_number)

    if factors < n do
      triangle_number_that_has_more_than_n_factors(num + 1, n)
    else
      triangle_number
    end
  end

  def number_of_factors(n) do
    root = trunc(n ** 0.5)

    result =
      1..(root + 1)
      |> Enum.filter(fn x -> rem(n, x) == 0 end)
      |> length()
      |> Kernel.*(2)

    if root * root == n do
      result - 1
    else
      result
    end
  end
end

P0012.solve()
|> IO.puts()

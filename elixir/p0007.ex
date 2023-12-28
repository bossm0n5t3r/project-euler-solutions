Code.require_file("./mathematics.ex", __DIR__)

defmodule P0007 do
  @moduledoc """
  10001st Prime
  Problem 7

  https://projecteuler.net/problem=7
  """

  def solve() do
    nst_prime(10001)
  end

  def nst_prime(n), do: nst_prime(n, 2)

  def nst_prime(n, num) when n >= 1 do
    if Mathematics.is_prime?(num) do
      nst_prime(n - 1, num + 1)
    else
      nst_prime(n, num + 1)
    end
  end

  def nst_prime(0, num), do: num - 1
end

P0007.solve()
|> IO.puts()

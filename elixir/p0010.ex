Code.require_file("./mathematics.ex", __DIR__)

defmodule P0010 do
  @moduledoc """
  Summation of Primes
  Problem 10

  https://projecteuler.net/problem=10
  """

  def solve() do
    Enum.to_list(2..2_000_000)
    |> Enum.filter(&Mathematics.is_prime?/1)
    |> Enum.sum()
  end
end

P0010.solve()
|> IO.puts()

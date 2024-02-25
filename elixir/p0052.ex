defmodule P0052 do
  @moduledoc """
  Permuted Multiples
  Problem 52

  https://projecteuler.net/problem=52
  """

  def solve() do
    Stream.iterate(1, &(&1 + 1))
    |> Enum.find(fn x -> is_permuted_multiples?(x) end)
  end

  def is_permuted_multiples?(x) do
    is_permutation?(x, x * 2) and is_permutation?(x, x * 3) and is_permutation?(x, x * 4) and
      is_permutation?(x, x * 5) and is_permutation?(x, x * 6)
  end

  def is_permutation?(a, b) do
    a |> Integer.digits() |> Enum.sort() == b |> Integer.digits() |> Enum.sort()
  end
end

P0052.solve()
|> IO.puts()

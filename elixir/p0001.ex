defmodule P0001 do
  @moduledoc """
  Multiples of 3 or 5
  Problem 1

  https://projecteuler.net/problem=1
  """

  def solve() do
    Enum.to_list(1..999)
    |> Enum.filter(&(is_multiple_of(&1, 3) || is_multiple_of(&1, 5)))
    |> Enum.sum()
  end

  def is_multiple_of(num, multiple) do
    rem(num, multiple) == 0
  end
end

P0001.solve()
|> IO.puts()

defmodule P0029 do
  @moduledoc """
  Distinct Powers
  Problem 29

  https://projecteuler.net/problem=29
  """

  def solve() do
    2..100
    |> Enum.map(fn a -> 2..100 |> Enum.map(fn b -> {a, b} end) end)
    |> List.flatten()
    |> Enum.map(fn {a, b} -> a ** b end)
    |> MapSet.new()
    |> Enum.count()
  end
end

P0029.solve()
|> IO.puts()

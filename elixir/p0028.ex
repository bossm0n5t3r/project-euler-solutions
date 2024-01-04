defmodule P0028 do
  @moduledoc """
  Number Spiral Diagonals
  Problem 28

  https://projecteuler.net/problem=28
  """

  def solve() do
    1001
    |> get_range
    |> Enum.reduce(0, fn x, acc -> acc + get_diagonals(x) end)
  end

  def get_range(n), do: 1..div(n + 1, 2)

  def get_diagonals(1), do: 1

  def get_diagonals(num), do: 4 * (2 * num - 1) ** 2 - 6 * (num - 1) * 2
end

P0028.solve()
|> IO.puts()

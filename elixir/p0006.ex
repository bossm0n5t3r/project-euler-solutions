defmodule P0006 do
  @moduledoc """
  Sum Square Difference
  Problem 6

  https://projecteuler.net/problem=6
  """

  def solve() do
    (square_of_sum(100) - sum_of_squares(100))
    |> trunc
  end

  def square_of_sum(num) do
    Enum.to_list(1..num)
    |> Enum.sum()
    |> :math.pow(2)
  end

  def sum_of_squares(num) do
    Enum.to_list(1..num)
    |> Enum.map(fn x -> :math.pow(x, 2) end)
    |> Enum.sum()
  end
end

P0006.solve()
|> IO.puts()

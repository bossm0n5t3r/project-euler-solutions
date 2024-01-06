defmodule P0030 do
  @moduledoc """
  Digit Fifth Powers
  Problem 30

  https://projecteuler.net/problem=30
  """

  def solve() do
    10..999_999
    |> Enum.filter(fn x ->
      x == x |> Integer.digits() |> Enum.map(fn y -> :math.pow(y, 5) end) |> Enum.sum()
    end)
    |> Enum.sum()
  end
end

P0030.solve()
|> IO.puts()

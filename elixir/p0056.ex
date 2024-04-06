defmodule P0056 do
  @moduledoc """
  Powerful Digit Sum
  Problem 56

  https://projecteuler.net/problem=56
  """

  def solve() do
    1..99
    |> Enum.map(fn a ->
      1..99 |> Enum.map(fn b -> {a, b} end)
    end)
    |> List.flatten()
    |> Enum.map(fn {a, b} -> (a ** b) |> Integer.digits() |> Enum.sum() end)
    |> Enum.max()
  end
end

P0056.solve()
|> IO.puts()

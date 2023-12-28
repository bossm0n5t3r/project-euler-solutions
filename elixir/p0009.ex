defmodule P0009 do
  @moduledoc """
  Special Pythagorean Triplet
  Problem 9

  https://projecteuler.net/problem=9
  """

  def solve() do
    1..div(1000, 3)
    |> Enum.map(fn x ->
      (div(1000, 3) - 1)..(1000 - 2) |> Enum.map(fn z -> {x, 1000 - x - z, z} end)
    end)
    |> List.flatten()
    |> Enum.find(fn {x, y, z} -> :math.pow(x, 2) + :math.pow(y, 2) == :math.pow(z, 2) end)
    |> (fn {x, y, z} -> x * y * z end).()
  end
end

P0009.solve()
|> IO.puts()

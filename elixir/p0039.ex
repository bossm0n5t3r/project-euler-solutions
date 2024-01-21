defmodule P0039 do
  @moduledoc """
  Integer Right Triangles
  Problem 39

  https://projecteuler.net/problem=39
  """

  def solve() do
    3..1000
    |> Enum.map(fn perimeter -> {perimeter, number_of_solutions(perimeter)} end)
    |> Enum.max_by(fn {_, x} -> x end)
    |> elem(0)
  end

  def number_of_solutions(perimeter) do
    1..(perimeter - 2)
    |> Enum.map(fn a ->
      1..(perimeter - a - 1) |> Enum.map(fn b -> {a, b, perimeter - a - b} end)
    end)
    |> List.flatten()
    |> Enum.filter(fn {a, b, c} -> a * a + b * b == c * c end)
    |> Enum.count()
    |> div(3)
  end
end

P0039.solve()
|> IO.puts()

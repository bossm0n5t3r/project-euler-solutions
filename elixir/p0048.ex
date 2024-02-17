defmodule P0048 do
  @moduledoc """
  Self Powers
  Problem 48

  https://projecteuler.net/problem=48
  """

  def solve() do
    1..1000
    |> Enum.map(fn x -> x ** x end)
    |> Enum.sum()
    |> Integer.to_string()
    |> String.slice(-10..-1)
  end
end

P0048.solve()
|> IO.puts()

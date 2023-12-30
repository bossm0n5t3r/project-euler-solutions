defmodule P0016 do
  @moduledoc """
  Power Digit Sum
  Problem 16

  https://projecteuler.net/problem=16
  """

  def solve() do
    (2 ** 1000)
    |> Integer.digits()
    |> Enum.sum()
  end
end

P0016.solve()
|> IO.puts()

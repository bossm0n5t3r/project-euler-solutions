Code.require_file("./mathematics.ex", __DIR__)

defmodule P0020 do
  @moduledoc """
  Factorial Digit Sum
  Problem 20

  https://projecteuler.net/problem=20
  """

  def solve() do
    Mathematics.factorial(100)
    |> Integer.digits()
    |> Enum.sum()
  end
end

P0020.solve()
|> IO.puts()

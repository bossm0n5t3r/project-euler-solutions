Code.require_file("./mathematics.ex", __DIR__)

defmodule P0015 do
  @moduledoc """
  Lattice Paths
  Problem 15

  https://projecteuler.net/problem=15
  """

  def solve() do
    Mathematics.combination(2 * 20, 20)
  end
end

P0015.solve()
|> IO.puts()

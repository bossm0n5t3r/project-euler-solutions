Code.require_file("./mathematics.ex", __DIR__)

defmodule P0005 do
  @moduledoc """
  Smallest Multiple
  Problem 5

  https://projecteuler.net/problem=5
  """

  def solve() do
    Enum.to_list(1..20)
    |> Enum.reduce(1, fn x, acc -> Mathematics.lcm(x, acc) end)
  end
end

P0005.solve()
|> IO.puts()

Code.require_file("./mathematics.ex", __DIR__)

defmodule P0053 do
  @moduledoc """
  Combinatoric Selections
  Problem 53

  https://projecteuler.net/problem=53
  """

  def solve() do
    1..100
    |> Enum.flat_map(fn n ->
      1..n
      |> Enum.map(fn k ->
        Mathematics.combination(n, k)
      end)
    end)
    |> Enum.filter(fn x -> x > 1_000_000 end)
    |> Enum.count()
  end
end

P0053.solve()
|> IO.puts()

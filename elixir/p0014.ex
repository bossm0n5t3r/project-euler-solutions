defmodule P0014 do
  @moduledoc """
  Longest Collatz Sequence
  Problem 14

  https://projecteuler.net/problem=14
  """

  def solve() do
    1..1_000_000
    |> Enum.map(fn x -> {x, length(collatz_sequence(x, [x]))} end)
    |> Enum.max_by(fn {_x, y} -> y end)
    |> elem(0)
  end

  def collatz_sequence(x, history) when rem(x, 2) == 0 do
    next = div(x, 2)
    collatz_sequence(next, [next | history])
  end

  def collatz_sequence(x, history) when x > 1 and rem(x, 2) == 1 do
    next = 3 * x + 1
    collatz_sequence(next, [next | history])
  end

  def collatz_sequence(x, history) when x == 1 do
    history
  end
end

P0014.solve()
|> IO.puts()

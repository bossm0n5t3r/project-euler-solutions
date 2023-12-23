defmodule P0002 do
  @moduledoc """
  Even Fibonacci Numbers
  Problem 2

  https://projecteuler.net/problem=2
  """

  def solve() do
    fib()
    |> Enum.take_while(fn x -> x < 4_000_000 end)
    |> Enum.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.sum()
  end

  def fib() do
    Stream.unfold({0, 1}, fn {current, next} ->
      {current, {next, current + next}}
    end)
  end
end

P0002.solve()
|> IO.puts()

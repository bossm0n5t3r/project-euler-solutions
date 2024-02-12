Code.require_file("./mathematics.ex", __DIR__)

defmodule P0046 do
  @moduledoc """
  Goldbach's Other Conjecture
  Problem 46

  https://projecteuler.net/problem=46
  """

  def solve() do
    Stream.iterate(1, &(&1 + 2))
    |> Enum.find(fn x -> Mathematics.is_composite?(x) and !is_goldbach_other_conjecture?(x) end)
  end

  def is_goldbach_other_conjecture?(num) do
    is_goldbach_other_conjecture?(num, 1)
  end

  def is_goldbach_other_conjecture?(num, n) when num - 2 * n * n > 0 do
    if Mathematics.is_prime?(num - 2 * n * n) do
      true
    else
      is_goldbach_other_conjecture?(num, n + 1)
    end
  end

  def is_goldbach_other_conjecture?(num, n) when num - 2 * n * n <= 0 do
    false
  end
end

P0046.solve()
|> IO.puts()

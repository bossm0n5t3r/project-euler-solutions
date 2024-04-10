defmodule P0057 do
  @moduledoc """
  Square Root Convergents
  Problem 57

  https://projecteuler.net/problem=57
  """

  def solve() do
    Stream.iterate(
      {3, 2},
      fn {numerator, denominator} ->
        get_next_fraction(numerator, denominator)
      end
    )
    |> Enum.take(1000)
    |> Enum.filter(fn {numerator, denominator} ->
      numerator |> Integer.digits() |> length() > denominator |> Integer.digits() |> length()
    end)
    |> Enum.count()
  end

  def get_next_fraction(numerator, denominator) do
    {numerator + 2 * denominator, numerator + denominator}
  end
end

P0057.solve()
|> IO.puts()

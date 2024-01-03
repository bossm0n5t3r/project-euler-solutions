defmodule P0026 do
  @moduledoc """
  Reciprocal Cycles
  Problem 26

  https://projecteuler.net/problem=26
  """

  def solve() do
    1..999
    |> Enum.map(fn x -> {x, get_recurring_cycle(x)} end)
    |> Enum.max_by(fn {_x, y} -> y end)
    |> elem(0)
  end

  def get_recurring_cycle(d) when rem(d, 2) == 0, do: get_recurring_cycle(div(d, 2))

  def get_recurring_cycle(d) when rem(d, 5) == 0, do: get_recurring_cycle(div(d, 5))

  def get_recurring_cycle(1), do: 0

  def get_recurring_cycle(d), do: get_recurring_cycle(1, d)

  def get_recurring_cycle(k, d) do
    if rem(10 ** k, d) == 1 do
      k
    else
      get_recurring_cycle(k + 1, d)
    end
  end
end

P0026.solve()
|> IO.puts()

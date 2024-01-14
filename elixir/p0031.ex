defmodule P0031 do
  @moduledoc """
  Coin Sums
  Problem 31

  https://projecteuler.net/problem=31
  """

  def solve() do
    coins = [1, 2, 5, 10, 20, 50, 100, 200]
    coin_sums(coins, 200)
  end

  def coin_sums(coins, target) do
    dp =
      ([1] ++ List.duplicate(0, target))
      |> Enum.with_index()
      |> Enum.map(fn {x, y} -> {y, x} end)
      |> Enum.into(%{})

    dp =
      Enum.reduce(coins, dp, fn coin, acc ->
        Enum.reduce(coin..target, acc, fn i, acc ->
          Map.put(acc, i, Map.get(acc, i) + Map.get(acc, i - coin))
        end)
      end)

    Map.get(dp, target)
  end
end

P0031.solve()
|> IO.puts()

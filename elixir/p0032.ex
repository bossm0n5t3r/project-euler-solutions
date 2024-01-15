Code.require_file("./mathematics.ex", __DIR__)

defmodule P0032 do
  @moduledoc """
  Pandigital Products
  Problem 32

  https://projecteuler.net/problem=32
  """

  def solve() do
    1..9
    |> Enum.to_list()
    |> Mathematics.get_all_permutations()
    |> Enum.map(fn x -> get_all_pandigital_products(x) end)
    |> List.flatten()
    |> Enum.map(fn {_, _, x} -> x end)
    |> Enum.uniq()
    |> Enum.sum()
  end

  def get_all_pandigital_products(list) do
    Enum.reduce(1..7, [], fn x, acc ->
      Enum.reduce((x + 1)..8, acc, fn y, acc ->
        first = Enum.slice(list, 0, x) |> Enum.join("") |> String.to_integer()
        second = Enum.slice(list, x, y - x) |> Enum.join("") |> String.to_integer()
        third = Enum.slice(list, y, 9 - y) |> Enum.join("") |> String.to_integer()
        if first * second == third, do: [{first, second, third} | acc], else: acc
      end)
    end)
  end
end

P0032.solve()
|> IO.puts()

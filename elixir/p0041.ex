Code.require_file("./mathematics.ex", __DIR__)

defmodule P0041 do
  @moduledoc """
  Pandigital Prime
  Problem 41

  https://projecteuler.net/problem=41
  """

  def solve() do
    7_654_321..1//-1
    |> Enum.find(fn x -> Mathematics.is_prime?(x) and is_pandigital?(x) end)
  end

  def is_pandigital?(num) do
    digits = num |> Integer.digits()
    Enum.sort(digits) == 1..Enum.count(digits) |> Enum.to_list()
  end
end

P0041.solve()
|> IO.puts()

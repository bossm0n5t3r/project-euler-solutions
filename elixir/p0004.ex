Code.require_file("./mathematics.ex", __DIR__)

defmodule P0004 do
  @moduledoc """
  Largest Palindrome Product
  Problem 4

  https://projecteuler.net/problem=4
  """

  def solve() do
    Enum.to_list(100..999)
    |> Enum.map(fn x -> Enum.to_list(100..999) |> Enum.map(fn y -> x * y end) end)
    |> List.flatten()
    |> Enum.filter(&Mathematics.is_palindrome?/1)
    |> Enum.max()
  end
end

P0004.solve()
|> IO.puts()

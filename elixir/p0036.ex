Code.require_file("./mathematics.ex", __DIR__)

defmodule P0036 do
  @moduledoc """
  Double-base Palindromes
  Problem 36

  https://projecteuler.net/problem=36
  """

  def solve() do
    1..999_999
    |> Enum.filter(fn x -> is_palindrome?(x) and is_palindrome?(number_to_binary(x)) end)
    |> IO.inspect()
    |> Enum.sum()
  end

  def number_to_binary(number) do
    Integer.to_string(number, 2)
  end

  def is_palindrome?(number) when is_number(number) do
    number
    |> Integer.to_string()
    |> is_palindrome?()
  end

  def is_palindrome?(number_string) when is_bitstring(number_string) do
    number_string
    |> String.reverse()
    |> String.equivalent?(number_string)
  end
end

P0036.solve()
|> IO.puts()

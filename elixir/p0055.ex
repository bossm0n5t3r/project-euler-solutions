Code.require_file("./mathematics.ex", __DIR__)

defmodule P0055 do
  @moduledoc """
  Lychrel Numbers
  Problem 55

  https://projecteuler.net/problem=55
  """

  def solve() do
    1..9999
    |> Enum.filter(fn x -> !is_lychrel_number?(x) end)
    |> Enum.count()
  end

  def is_lychrel_number?(num) do
    is_lychrel_number?(num, 0)
  end

  def is_lychrel_number?(_, count) when count >= 50 do
    false
  end

  def is_lychrel_number?(num, count) do
    target = num + reverse(num)

    if Mathematics.is_palindrome?(target) do
      true
    else
      is_lychrel_number?(target, count + 1)
    end
  end

  def reverse(num) do
    num
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end
end

P0055.solve()
|> IO.puts()

Code.require_file("./mathematics.ex", __DIR__)

defmodule P0023 do
  @moduledoc """
  Non-Abundant Sums
  Problem 23

  https://projecteuler.net/problem=23
  """

  def solve() do
    num = 28123
    all_sum_of_two_abundant_numbers_set = get_all_sum_of_two_abundant_numbers_set(num)

    1..num
    |> Enum.filter(fn x ->
      !MapSet.member?(all_sum_of_two_abundant_numbers_set, x)
    end)
    |> Enum.sum()
  end

  def get_all_sum_of_two_abundant_numbers_set(num) do
    all_abundant_numbers = get_all_abundant_numbers(num)

    all_abundant_numbers
    |> Enum.map(fn x ->
      Enum.map(all_abundant_numbers, fn y -> x + y end)
      |> Enum.filter(fn z -> z <= num end)
    end)
    |> List.flatten()
    |> MapSet.new()
  end

  def get_all_abundant_numbers(num) do
    1..num
    |> Enum.filter(&is_abundant?/1)
  end

  def is_abundant?(num) do
    num < Mathematics.get_sum_of_proper_divisors(num)
  end
end

P0023.solve()
|> IO.puts()

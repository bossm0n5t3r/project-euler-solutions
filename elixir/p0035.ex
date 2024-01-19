Code.require_file("./mathematics.ex", __DIR__)

defmodule P0035 do
  @moduledoc """
  Circular Primes
  Problem 35

  https://projecteuler.net/problem=35
  """

  def solve() do
    1..999_999
    |> Enum.filter(fn x -> is_all_prime?(circular_numbers(x)) end)
    |> IO.inspect()
    |> Enum.count()
  end

  def circular_numbers(number) when is_number(number),
    do: circular_numbers([Integer.digits(number)])

  def circular_numbers(number_digits_list) when is_list(number_digits_list) do
    last_number = List.last(number_digits_list)
    next_circular_number = next_circular_number(last_number)

    if Enum.member?(number_digits_list, next_circular_number) do
      number_digits_list
    else
      circular_numbers(number_digits_list ++ [next_circular_number])
    end
  end

  def next_circular_number(number_digits) do
    [head | tail] = number_digits
    tail ++ [head]
  end

  def is_all_prime?(number_digits_list) do
    number_list = Enum.map(number_digits_list, fn x -> Integer.undigits(x) end)
    default_number_length = hd(number_list) |> Integer.digits() |> length

    Enum.all?(number_list, fn x ->
      length(Integer.digits(x)) == default_number_length and Mathematics.is_prime?(x)
    end)
  end
end

P0035.solve()
|> IO.puts()

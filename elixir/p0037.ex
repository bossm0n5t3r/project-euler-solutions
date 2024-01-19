Code.require_file("./mathematics.ex", __DIR__)

defmodule P0037 do
  @moduledoc """
  Truncatable Primes
  Problem 37

  https://projecteuler.net/problem=37
  """

  def solve() do
    1..999_999
    |> Enum.filter(&is_truncatable_prime?/1)
    |> IO.inspect()
    |> Enum.sum()
  end

  def is_truncatable_prime?(number) do
    if number |> Integer.digits() |> length() == 1 do
      false
    else
      left_to_right =
        remove_digits_from_left_to_right([number])
        |> Enum.all?(fn x -> Mathematics.is_prime?(x) end)

      right_to_left =
        remove_digits_from_right_to_left([number])
        |> Enum.all?(fn x -> Mathematics.is_prime?(x) end)

      left_to_right and right_to_left
    end
  end

  def remove_digits_from_left_to_right(number_list) do
    last_number = List.last(number_list)

    if last_number |> Integer.digits() |> length() == 1 do
      number_list
    else
      [_ | tail] = Integer.digits(last_number)

      remove_digits_from_left_to_right(
        number_list ++ [tail |> Enum.join("") |> String.to_integer()]
      )
    end
  end

  def remove_digits_from_right_to_left(number_list) do
    first_number = List.first(number_list)

    if first_number |> Integer.digits() |> length() == 1 do
      number_list
    else
      remove_tail =
        Integer.digits(first_number)
        |> Enum.reverse()
        |> tl()
        |> Enum.reverse()
        |> Enum.join("")
        |> String.to_integer()

      remove_digits_from_right_to_left([remove_tail] ++ number_list)
    end
  end
end

P0037.solve()
|> IO.puts()

defmodule P0017 do
  @moduledoc """
  Number Letter Counts
  Problem 17

  https://projecteuler.net/problem=17
  """

  def solve() do
    1..1000
    |> Enum.map(fn x -> number_to_words_until_thousand(x) end)
    |> Enum.map(fn x -> String.length(x) end)
    |> Enum.sum()
  end

  def number_to_words_until_thousand(number) when number <= 0 do
    ""
  end

  def number_to_words_until_thousand(number) when 1 <= number and number < 10 do
    first_digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    Enum.at(first_digits, number)
  end

  def number_to_words_until_thousand(number) when 10 <= number and number < 20 do
    ten_to_nineteen = [
      "ten",
      "eleven",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen"
    ]

    Enum.at(ten_to_nineteen, number - 10)
  end

  def number_to_words_until_thousand(number) when 20 <= number and number < 100 do
    tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    Enum.at(tens, div(number, 10)) <>
      number_to_words_until_thousand(number - div(number, 10) * 10)
  end

  def number_to_words_until_thousand(number) when 100 <= number and number < 1000 do
    first_digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    if rem(number, 100) == 0 do
      Enum.at(first_digits, div(number, 100)) <> "hundred"
    else
      Enum.at(first_digits, div(number, 100)) <>
        "hundred" <>
        "and" <>
        number_to_words_until_thousand(number - div(number, 100) * 100)
    end
  end

  def number_to_words_until_thousand(number) when number == 1000 do
    "one" <> "thousand"
  end
end

P0017.solve()
|> IO.puts()

defmodule P0019 do
  @moduledoc """
  Counting Sundays
  Problem 19

  https://projecteuler.net/problem=19
  """

  def solve() do
    calculate_sundays_fell_on_the_first_of_month({1900, 1, 1}, 0)
  end

  def calculate_sundays_fell_on_the_first_of_month({year, month, day_of_first_of_month}, count)
      when year == 1900 do
    calculate_sundays_fell_on_the_first_of_month(
      next_month({year, month, day_of_first_of_month}),
      count
    )
  end

  def calculate_sundays_fell_on_the_first_of_month({year, month, day_of_first_of_month}, count)
      when year <= 2000 and month <= 12 do
    if day_of_first_of_month == 0 do
      calculate_sundays_fell_on_the_first_of_month(
        next_month({year, month, day_of_first_of_month}),
        count + 1
      )
    else
      calculate_sundays_fell_on_the_first_of_month(
        next_month({year, month, day_of_first_of_month}),
        count
      )
    end
  end

  def calculate_sundays_fell_on_the_first_of_month({year, month, _}, count)
      when year == 2001 and month == 1 do
    count
  end

  def next_month({year, month, day_of_first_of_month}) when month == 12 do
    {year + 1, 1, rem(day_of_first_of_month + 3, 7)}
  end

  def next_month({year, month, day_of_first_of_month}) when month == 2 do
    if is_leap_year(year) do
      {year, month + 1, rem(day_of_first_of_month + 1, 7)}
    else
      {year, month + 1, day_of_first_of_month}
    end
  end

  def next_month({year, month, day_of_first_of_month})
      when month == 4 or month == 6 or month == 9 or month == 11 do
    {year, month + 1, rem(day_of_first_of_month + 2, 7)}
  end

  def next_month({year, month, day_of_first_of_month})
      when month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 do
    {year, month + 1, rem(day_of_first_of_month + 3, 7)}
  end

  def is_leap_year(year) do
    rem(year, 4) == 0 && (rem(year, 100) != 0 || rem(year, 400) == 0)
  end
end

P0019.solve()
|> IO.puts()

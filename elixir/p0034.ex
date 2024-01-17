Code.require_file("./mathematics.ex", __DIR__)

defmodule P0034 do
  @moduledoc """
  Digit Factorials
  Problem 34

  https://projecteuler.net/problem=34
  """

  def solve() do
    3..999_999
    |> Enum.filter(&is_number_which_is_factorial_of_sum_of_digits?/1)
    |> IO.inspect()
    |> Enum.sum()
  end

  def is_number_which_is_factorial_of_sum_of_digits?(number) do
    number
    |> Integer.digits()
    |> Enum.map(fn x -> Mathematics.factorial(x) end)
    |> Enum.sum()
    |> Kernel.==(number)
  end
end

P0034.solve()
|> IO.puts()

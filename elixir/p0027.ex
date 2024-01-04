Code.require_file("./mathematics.ex", __DIR__)

defmodule P0027 do
  @moduledoc """
  Quadratic Primes
  Problem 27

  https://projecteuler.net/problem=27
  """

  def solve() do
    -999..999
    |> Enum.map(fn a ->
      -1000..1000
      |> Enum.map(fn b ->
        {a * b, maximum_number_of_primes_for_consecutive_values_of_n(a, b, 0)}
      end)
    end)
    |> List.flatten()
    |> Enum.sort_by(fn {_, x} -> x end, :desc)
    |> Enum.at(0)
    |> elem(0)
  end

  def maximum_number_of_primes_for_consecutive_values_of_n(a, b, n) do
    is_prime =
      (n ** 2 + a * n + b)
      |> Mathematics.is_prime?()

    if is_prime do
      maximum_number_of_primes_for_consecutive_values_of_n(a, b, n + 1)
    else
      n
    end
  end
end

P0027.solve()
|> IO.puts()

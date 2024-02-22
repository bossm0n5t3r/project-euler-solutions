Code.require_file("./mathematics.ex", __DIR__)

defmodule P0049 do
  @moduledoc """
  Prime Permutations
  Problem 49

  https://projecteuler.net/problem=49
  """

  def solve() do
    get_4_digits_primes()
    |> find_all_sequences()
    |> Enum.find(fn [a, b, c] -> a != 1487 and is_permutation?(a, b) and is_permutation?(a, c) end)
    |> Enum.join()
  end

  def get_4_digits_primes() do
    1000..9999
    |> Enum.filter(fn x -> Mathematics.is_prime?(x) end)
  end

  def find_all_sequences(primes) do
    for i <- primes, j <- primes, k <- primes, reduce: MapSet.new() do
      acc ->
        if i < j and j < k and j - i == k - j do
          MapSet.put(acc, [i, j, k])
        else
          acc
        end
    end
  end

  def is_permutation?(a, b) do
    a |> Integer.digits() |> Enum.sort() == b |> Integer.digits() |> Enum.sort()
  end
end

P0049.solve()
|> IO.puts()

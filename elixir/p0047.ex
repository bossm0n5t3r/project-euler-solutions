Code.require_file("./mathematics.ex", __DIR__)

defmodule P0047 do
  @moduledoc """
  Distinct Primes Factors
  Problem 47

  https://projecteuler.net/problem=47
  """

  def solve() do
    primes =
      1..1_000_000
      |> Enum.filter(&Mathematics.is_prime?/1)
      |> MapSet.new()

    Stream.iterate(1, &(&1 + 1))
    |> Enum.find(fn x ->
      is_four_consecutive_integers_to_have_four_distinct_primes_factors?(x, primes)
    end)
  end

  def is_four_consecutive_integers_to_have_four_distinct_primes_factors?(x, primes) do
    !MapSet.member?(primes, x) &&
      !MapSet.member?(primes, x + 1) &&
      !MapSet.member?(primes, x + 2) &&
      !MapSet.member?(primes, x + 3) &&
      is_number_to_have_distinct_primes_factors?(primes, x, 4) &&
      is_number_to_have_distinct_primes_factors?(primes, x + 1, 4) &&
      is_number_to_have_distinct_primes_factors?(primes, x + 2, 4) &&
      is_number_to_have_distinct_primes_factors?(primes, x + 3, 4)
  end

  def is_number_to_have_distinct_primes_factors?(primes, num, n) do
    prime_factors = get_distinct_prime_factors(primes, num)
    MapSet.size(prime_factors) == n
  end

  def get_distinct_prime_factors(primes, num) do
    get_distinct_prime_factors(primes, num, 2, MapSet.new())
  end

  def get_distinct_prime_factors(_, 1, _, prime_factors), do: prime_factors

  def get_distinct_prime_factors(primes, num, divisor, prime_factors) do
    if MapSet.member?(primes, divisor) and rem(num, divisor) == 0 do
      get_distinct_prime_factors(
        primes,
        div(num, divisor),
        divisor,
        MapSet.put(prime_factors, divisor)
      )
    else
      get_distinct_prime_factors(primes, num, divisor + 1, prime_factors)
    end
  end
end

P0047.solve()
|> IO.puts()

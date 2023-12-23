defmodule P0003 do
  @moduledoc """
  Largest Prime Factor
  Problem 3

  https://projecteuler.net/problem=3
  """

  def solve() do
    {2, 600_851_475_143}
    |> get_factors
  end

  def get_factors({i, n}) when i <= n do
    get_factors({
      i + 1,
      if i < n && rem(n, i) == 0 do
        div(n, i)
      else
        n
      end
    })
  end

  def get_factors({i, n}) when i > n, do: n
end

P0003.solve()
|> IO.puts()

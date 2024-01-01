Code.require_file("./mathematics.ex", __DIR__)

defmodule P0024 do
  @moduledoc """
  Lexicographic Permutations
  Problem 24

  https://projecteuler.net/problem=24
  """

  def solve() do
    Mathematics.get_all_permutations([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    |> Enum.at(999_999)
    |> Enum.join()
  end
end

P0024.solve()
|> IO.puts()

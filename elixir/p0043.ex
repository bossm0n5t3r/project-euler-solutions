Code.require_file("./mathematics.ex", __DIR__)

defmodule P0043 do
  @moduledoc """
  Sub-string Divisibility
  Problem 43

  https://projecteuler.net/problem=43
  """

  def solve() do
    Mathematics.get_all_permutations([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    |> Enum.filter(fn x -> Enum.at(x, 0) != 0 end)
    |> Enum.filter(fn x -> is_interesting_sub_string_divisibility_property?(x) end)
    |> Enum.map(fn x -> Enum.join(x) |> String.to_integer() end)
    |> Enum.sum()
  end

  def is_interesting_sub_string_divisibility_property?(list) do
    sub_string_integer =
      list
      |> Enum.chunk_every(3, 1, :discard)
      |> Enum.drop(1)
      |> Enum.map(fn x -> Enum.join(x) |> String.to_integer() end)

    rem(Enum.at(sub_string_integer, 0), 2) == 0 and
      rem(Enum.at(sub_string_integer, 1), 3) == 0 and
      rem(Enum.at(sub_string_integer, 2), 5) == 0 and
      rem(Enum.at(sub_string_integer, 3), 7) == 0 and
      rem(Enum.at(sub_string_integer, 4), 11) == 0 and
      rem(Enum.at(sub_string_integer, 5), 13) == 0 and
      rem(Enum.at(sub_string_integer, 6), 17) == 0
  end
end

P0043.solve()
|> IO.puts()

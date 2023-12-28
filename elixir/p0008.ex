Code.require_file("./file_util.ex", __DIR__)

defmodule P0008 do
  @moduledoc """
  Largest Product in a Series
  Problem 8

  https://projecteuler.net/problem=8
  """

  def solve() do
    FileUtil.read_file("p0008.txt")
    |> string_to_integer_list
    |> Enum.chunk_every(13, 1, :discard)
    |> Enum.map(fn x -> Enum.reduce(x, 1, fn y, acc -> y * acc end) end)
    |> Enum.max()
  end

  def string_to_integer_list(string) do
    string
    |> to_charlist
    |> Enum.map(&(&1 - ?0))
  end
end

P0008.solve()
|> IO.puts()

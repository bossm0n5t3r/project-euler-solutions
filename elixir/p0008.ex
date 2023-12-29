Code.require_file("./file_util.ex", __DIR__)

defmodule P0008 do
  @moduledoc """
  Largest Product in a Series
  Problem 8

  https://projecteuler.net/problem=8
  """

  def solve() do
    FileUtil.read_text("p0008.txt")
    |> String.replace("\n", "")
    |> string_to_integer_list_using_codepoints
    # |> string_to_integer_list_using_charlist # or use this
    |> Enum.chunk_every(13, 1, :discard)
    |> Enum.map(fn x -> Enum.reduce(x, 1, fn y, acc -> y * acc end) end)
    |> Enum.max()
  end

  # https://hexdocs.pm/elixir/1.16.0/String.html#codepoints/1
  def string_to_integer_list_using_codepoints(string) do
    string
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end

  # https://hexdocs.pm/elixir/1.16.0/String.html#to_charlist/1
  def string_to_integer_list_using_charlist(string) do
    string
    |> to_charlist()
    |> Enum.map(&(&1 - ?0))
  end
end

P0008.solve()
|> IO.puts()

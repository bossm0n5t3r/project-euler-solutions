Code.require_file("./file_util.ex", __DIR__)

defmodule P0013 do
  @moduledoc """
  Large Sum
  Problem 13

  https://projecteuler.net/problem=13
  """

  def solve() do
    FileUtil.read_lines("p0013.txt")
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum()
    |> to_string()
    |> String.slice(0..9)
  end
end

P0013.solve()
|> IO.puts()

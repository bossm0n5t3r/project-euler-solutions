Code.require_file("./file_util.ex", __DIR__)

defmodule P0022 do
  @moduledoc """
  Names Scores
  Problem 22

  https://projecteuler.net/problem=22
  """

  def solve() do
    FileUtil.read_text("p0022.txt")
    |> String.replace("\"", "")
    |> String.split(",")
    |> Enum.sort()
    |> Enum.with_index(1)
    |> Enum.map(&get_name_score/1)
    |> Enum.sum()
  end

  def get_name_score({name, index}) do
    name
    |> String.to_charlist()
    |> Enum.map(&(&1 - ?A + 1))
    |> Enum.sum()
    |> Kernel.*(index)
  end
end

P0022.solve()
|> IO.inspect()

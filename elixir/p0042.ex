Code.require_file("./file_util.ex", __DIR__)

defmodule P0042 do
  @moduledoc """
  Coded Triangle Numbers
  Problem 42

  https://projecteuler.net/problem=42
  """

  def solve() do
    FileUtil.read_text("p0042.txt")
    |> String.replace("\"", "")
    |> String.split(",")
    |> Enum.map(fn x -> get_number_of_word(x) end)
    |> Enum.filter(&is_triangle_number?/1)
    |> Enum.count()
  end

  def get_number_of_word(word) do
    word
    |> String.to_charlist()
    |> Enum.reduce(0, fn x, acc -> acc + x - ?A + 1 end)
  end

  def is_triangle_number?(num) do
    num
    |> Kernel.*(2)
    |> :math.sqrt()
    |> trunc
    |> (&(&1 * (&1 + 1))).() == num * 2
  end
end

P0042.solve()
|> IO.puts()

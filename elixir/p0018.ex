Code.require_file("./file_util.ex", __DIR__)

defmodule P0018 do
  @moduledoc """
  Maximum Path Sum I
  Problem 18

  https://projecteuler.net/problem=18
  """

  def solve() do
    FileUtil.read_lines("p0018.txt")
    |> Enum.map(fn x ->
      String.split(x, " ", trim: true)
      |> Enum.map(fn y -> String.to_integer(y) end)
    end)
    |> Enum.reverse()
    |> Enum.map(fn row -> append_index(row) end)
    |> get_maximum_path_sum()
    |> elem(0)
  end

  def get_maximum_path_sum([row, comparison_row | rest_rows]) do
    row = reduce_row(row, comparison_row)
    get_maximum_path_sum([row | rest_rows])
  end

  def get_maximum_path_sum([row]), do: List.first(row)

  def reduce_row(row, comparison_row) do
    for {{main, index}, {opt1, index1}, {opt2, index2}} <- pairs(row, comparison_row) do
      sum1 = main + opt1
      sum2 = main + opt2

      if sum1 > sum2 do
        {sum1, index ++ index1}
      else
        {sum2, index ++ index2}
      end
    end
  end

  def append_index(row) do
    for {num, index} <- Enum.with_index(row) do
      {num, [index]}
    end
  end

  def pairs(row, comparison_row) do
    for {num, path = [index | _]} <- comparison_row do
      {{num, path}, Enum.at(row, index), Enum.at(row, index + 1)}
    end
  end
end

P0018.solve()
|> IO.puts()

Code.require_file("./file_util.ex", __DIR__)

defmodule P0011 do
  @moduledoc """
  Largest Product in a Grid
  Problem 11

  https://projecteuler.net/problem=11
  """

  def solve() do
    FileUtil.read_lines("p0011.txt")
    |> Enum.map(fn x ->
      String.split(x, " ", trim: true) |> Enum.map(fn y -> String.to_integer(y) end)
    end)
    |> get_largest_product
  end

  def get_largest_product(grid) do
    row = length(grid)
    col = length(Enum.at(grid, 0))

    0..(row - 4)
    |> Enum.map(fn r ->
      0..(col - 4)
      |> Enum.map(fn c ->
        [
          get_product(grid, r, c, 1, 0, 4),
          get_product(grid, r, c, 0, 1, 4),
          get_product(grid, r, c, 1, 1, 4),
          if r - 3 >= 0 && c + 3 < col do
            get_product(grid, r, c, 1, -1, 4)
          else
            0
          end
        ]
        |> Enum.max()
      end)
    end)
    |> List.flatten()
    |> Enum.max()
  end

  def get_product(grid, r, c, dr, dc, n) do
    0..(n - 1)
    |> Enum.reduce(1, fn x, acc -> acc * Enum.at(Enum.at(grid, r + x * dr), c + x * dc) end)
  end
end

P0011.solve()
|> IO.puts()

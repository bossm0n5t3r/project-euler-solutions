Code.require_file("./mathematics.ex", __DIR__)

defmodule P0025 do
  @moduledoc """
  1000-digit Fibonacci Number
  Problem 25

  https://projecteuler.net/problem=25
  """

  def solve() do
    Mathematics.fib()
    |> Enum.take_while(fn x -> String.length(Integer.to_string(x)) <= 1000 end)
    |> Enum.with_index()
    |> Enum.find(fn {x, _} -> String.length(Integer.to_string(x)) == 1000 end)
    |> elem(1)
  end
end

P0025.solve()
|> IO.puts()

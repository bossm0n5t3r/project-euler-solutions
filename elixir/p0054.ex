Code.require_file("./file_util.ex", __DIR__)

defmodule P0054 do
  @moduledoc """
  Poker Hands
  Problem 54

  https://projecteuler.net/problem=54
  """

  def solve() do
    values = get_values()
    straights = get_straights()
    ranks = get_ranks()

    FileUtil.read_lines("p0054.txt")
    |> Enum.filter(fn line ->
      [hand1, hand2] =
        line
        |> String.split()
        |> Enum.chunk_every(5)

      hand_rank(hand1, values, straights, ranks) >
        hand_rank(hand2, values, straights, ranks)
    end)
    |> Enum.count()
  end

  defp hand_rank(hand, values, straights, ranks) do
    [counts, hand_ranks] = get_score(hand, values)

    is_flush =
      hand
      |> Enum.map(fn x -> x |> String.to_charlist() |> tl end)
      |> MapSet.new()
      |> Enum.count() == 1

    is_straight = Enum.member?(straights, hand_ranks)

    if is_straight do
      if is_flush do
        [8, hand_ranks]
      else
        [4, hand_ranks]
      end
    else
      if is_flush do
        [5, hand_ranks]
      else
        [Enum.find_index(ranks, fn x -> x == counts end), hand_ranks]
      end
    end
  end

  defp get_score(hand, values) do
    hand_values = hand |> Enum.map(fn x -> x |> String.to_charlist() |> hd end)
    hand_values_set = hand_values |> Enum.uniq()

    enums =
      hand_values_set
      |> Enum.map(fn unique_hand_value ->
        count = Enum.count(hand_values, fn x -> x == unique_hand_value end)

        [count, Map.get(values, unique_hand_value)]
      end)
      |> Enum.sort_by(fn x -> Enum.at(x, 1) end, &>=/2)
      |> Enum.sort_by(fn x -> Enum.at(x, 0) end, &>=/2)

    Enum.zip_reduce(enums, [], fn elements, acc ->
      [List.to_tuple(elements) | acc]
    end)
    |> Enum.reverse()
  end

  defp get_values() do
    "23456789TJQKA"
    |> String.split("", trim: true)
    |> Enum.with_index(2)
    |> Map.new(fn {k, v} -> {k |> String.to_charlist() |> hd, v} end)
  end

  defp get_straights() do
    tmp_straights =
      14..6//-1
      |> Enum.map(fn x -> {x, x - 1, x - 2, x - 3, x - 4} end)

    tmp_straights ++ [{14, 5, 4, 3, 2}]
  end

  defp get_ranks() do
    [{1, 1, 1, 1, 1}, {2, 1, 1, 1}, {2, 2, 1}, {3, 1, 1}, {}, {}, {3, 2}, {4, 1}]
  end
end

P0054.solve()
|> IO.puts()

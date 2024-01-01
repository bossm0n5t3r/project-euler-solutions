defmodule P0021 do
  @moduledoc """
  Amicable Numbers
  Problem 21

  https://projecteuler.net/problem=21
  """

  def solve() do
    get_all_amicable_numbers(
      1..9999 |> Enum.to_list(),
      MapSet.new(1..9999 |> Enum.to_list()),
      MapSet.new()
    )
    |> Enum.sum()
  end

  def get_all_amicable_numbers([num | remained_candidates], candidates_set, result_set) do
    sum_of_proper_divisors = get_sum_of_proper_divisors(num)

    if sum_of_proper_divisors == num do
      get_all_amicable_numbers(
        remained_candidates,
        MapSet.delete(candidates_set, num),
        result_set
      )
    else
      if MapSet.member?(candidates_set, sum_of_proper_divisors) do
        reversed_sum_of_proper_divisors = get_sum_of_proper_divisors(sum_of_proper_divisors)

        if reversed_sum_of_proper_divisors == num do
          get_all_amicable_numbers(
            remained_candidates,
            MapSet.delete(candidates_set, num)
            |> MapSet.delete(sum_of_proper_divisors),
            MapSet.put(result_set, num)
            |> MapSet.put(sum_of_proper_divisors)
          )
        else
          get_all_amicable_numbers(remained_candidates, candidates_set, result_set)
        end
      else
        get_all_amicable_numbers(remained_candidates, candidates_set, result_set)
      end
    end
  end

  def get_all_amicable_numbers([], _candidates_set, result_set) do
    result_set
  end

  def get_sum_of_proper_divisors(num) when num == 1, do: 0

  def get_sum_of_proper_divisors(num) do
    1..(num - 1)
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> Enum.sum()
  end
end

P0021.solve()
|> IO.puts()

defmodule Mathematics do
  def gcd(a, b) when b > 0, do: gcd(b, rem(a, b))
  def gcd(a, 0), do: a

  def lcm(a, b), do: div(a * b, gcd(a, b))

  def is_prime?(num) do
    if num == 2 or num == 3 do
      true
    else
      Enum.all?(2..trunc(:math.sqrt(num)), fn x -> rem(num, x) != 0 end)
    end
  end
end

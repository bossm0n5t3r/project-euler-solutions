defmodule Mathematics do
  def gcd(a, b) when b > 0, do: gcd(b, rem(a, b))
  def gcd(a, 0), do: a

  def lcm(a, b), do: div(a * b, gcd(a, b))
end

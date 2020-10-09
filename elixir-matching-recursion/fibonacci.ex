defmodule Fibonacci do
  def naive(0), do: 0
  def naive(1), do: 1

  def naive(n) do
    naive(n - 1) + naive(n - 2)
  end

  def tailRec(n), do: tailRec(n, 0, 1)
  def tailRec(n, prev, _cur) when n <= 0, do: prev

  def tailRec(n, prev, cur) do
    tailRec(n - 1, cur, prev + cur)
  end
end

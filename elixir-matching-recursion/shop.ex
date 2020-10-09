defmodule Shop do
  def buy(list), do: buy(list, 0)
  def buy([], total), do: total

  def buy([head | tail], total) do
    itemValue = calculateItemPrice(head) |> applyItemDiscount
    buy(tail, total + itemValue)
  end

  def applyItemDiscount(subtotal) do
    {item, quantity, total} = subtotal
    cond do
      item == :apple and quantity >= 10 -> total * 0.9
      item == :melon and quantity >= 15 -> total * 0.8
      true -> total
    end
  end

  def calculateItemPrice(item) do
    price = case item do
      {:orange, qty} -> 3
      {:apple, qty} -> 5
      {:pear, qty} -> 2
      {:melon, qty} -> 0
      _ -> 0
    end
    {name, qty} = item
    {name,qty, price * qty}
  end
end

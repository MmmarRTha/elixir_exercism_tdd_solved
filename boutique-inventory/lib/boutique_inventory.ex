defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map( inventory, fn item ->
        Map.update!(item, :name, fn name ->
          String.replace(name, old_word, new_word)
        end)
      end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn quantity ->
      Enum.into(quantity, %{}, fn {key, value} -> {key, value + count} end)
    end)
  end

def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size, %{})
    |> Enum.reduce(0, fn {_key, value}, acc -> acc + value end)
end
end

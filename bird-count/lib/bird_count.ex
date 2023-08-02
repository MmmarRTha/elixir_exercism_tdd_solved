defmodule BirdCount do
  def today(list) do
    list
    |> Enum.at(0)
  end

  def increment_day_count(list), do: [1]
  def increment_day_count(list) do
    [head | tail] = list

  end

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
  end

  def total(list) do
    # Please implement the total/1 function
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
  end
end

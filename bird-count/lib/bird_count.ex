defmodule BirdCount do
  def today(list) do
    list
    |> Enum.at(0)
  end

  def increment_day_count([list | tail]), do: [list + 1 | tail]
  def increment_day_count(_list), do: [1]

  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_list | tail]), do: has_day_without_birds?(tail)
  def has_day_without_birds?(_list), do: false

  def total(list) do
    # Please implement the total/1 functionm,./
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
  end
end

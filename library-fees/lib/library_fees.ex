defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  def before_noon?(datetime) do
    before_noon_time = NaiveDateTime.to_time(datetime)
    Time.compare(before_noon_time, ~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    date = NaiveDateTime.to_date(checkout_datetime)

    if before_noon?(checkout_datetime) do
      Date.add(date, 28)
    else
      Date.add(date, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    date_retuned = NaiveDateTime.to_date(actual_return_datetime)

    if Date.compare(date_retuned, planned_return_date) == :lt do
      0
    else
      Date.diff(date_retuned, planned_return_date)
    end
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planned_return = return_date(checkout_datetime)
    actual_return = datetime_from_string(return)

    days_late = days_late(planned_return, actual_return)

    rate = if monday?(actual_return), do: 0.5 * rate, else: rate

    trunc(days_late * rate)
  end
end

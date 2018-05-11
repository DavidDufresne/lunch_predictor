defmodule LunchPredictorWeb.PageController do
  use LunchPredictorWeb, :controller

  alias LunchPredictor.Lunches
  alias LunchPredictor.Statistics

  @english_day_names %{
    0 => "Sunday",
    1 => "Monday",
    2 => "Tuesday",
    3 => "Wednesday",
    4 => "Thursday",
    5 => "Friday",
    6 => "Saturday"
  }

  def index(conn, _params) do
    providers = Lunches.list_providers()
    priors = Enum.map(providers, fn(provider) -> Statistics.prior(provider.id) end)
    providers_with_priors = Enum.zip(providers, priors)
    day_of_week = @english_day_names[Date.day_of_week(Date.utc_today)]
    render conn, "index.html", providers_with_priors: providers_with_priors, day_of_week: day_of_week
  end
end

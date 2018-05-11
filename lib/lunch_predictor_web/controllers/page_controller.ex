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
    day_of_week = Date.day_of_week(Date.utc_today)
    providers_with_posteriors = Enum.map(providers, fn(provider) ->
      {provider, Statistics.denormalized_posterior(provider.id, day_of_week )}
    end)
    estimate = Statistics.map_estimate(Date.utc_today)
    day_of_week_name = @english_day_names[Date.day_of_week(Date.utc_today)]
    render conn, "index.html", providers_with_posteriors: providers_with_posteriors, day_of_week: day_of_week_name, estimate: estimate
  end
end

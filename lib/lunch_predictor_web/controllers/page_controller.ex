defmodule LunchPredictorWeb.PageController do
  use LunchPredictorWeb, :controller

  alias LunchPredictor.Lunches
  alias LunchPredictor.Statistics

  def index(conn, _params) do
    providers = Lunches.list_providers()
    priors = Enum.map(providers, fn(provider) -> Statistics.prior(provider.id) end)
    providers_with_priors = Enum.zip(providers, priors)
    render conn, "index.html", providers_with_priors: providers_with_priors
  end
end

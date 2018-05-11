defmodule LunchPredictor.Statistics do

  alias LunchPredictor.Lunches

  def prior(provider_id) do
    Lunches.number_of_lunches_with_provider_id(provider_id)/Lunches.number_of_lunches
  end

  def day_of_week_likelihood(day_of_week, provider_id) do
    Lunches.number_of_lunches_with_day_of_week_and_provider_id(day_of_week, provider_id)/Lunches.number_of_lunches_with_provider_id(provider_id)
  end

  def denormalized_posterior(provider_id, day_of_week) do
    prior(provider_id) * day_of_week_likelihood(day_of_week, provider_id)
  end
end

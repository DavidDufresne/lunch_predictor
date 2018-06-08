defmodule LunchPredictor.Statistics do

  alias LunchPredictor.Lunches

  def prior(provider_id) do
    Lunches.number_of_lunches_with_provider_id(provider_id)/Lunches.number_of_lunches
  end

  def day_of_week_likelihood(day_of_week, provider_id) do
    Lunches.number_of_lunches_with_day_of_week_and_provider_id(day_of_week, provider_id)/Lunches.number_of_lunches_with_provider_id(provider_id)
  end

  def previous_provider_likelihood(previous_provider_id, provider_id) do
    Lunches.number_of_lunches_with_previous_provider_id_and_provider_id(previous_provider_id, provider_id)/Lunches.number_of_lunches_with_provider_id(provider_id)
  end

  def denormalized_posterior(provider_id, day_of_week, previous_provider_id) do
    prior(provider_id) * day_of_week_likelihood(day_of_week, provider_id) * previous_provider_likelihood(previous_provider_id, provider_id)
  end

  def map_estimate(today) do
    # features
    day_of_week = Date.day_of_week(today)
    providers = Lunches.list_providers()
    last_provider = Lunches.latest_provider(today)

    Enum.max_by(providers, fn(provider) -> denormalized_posterior(provider.id, day_of_week, last_provider.id) end)
  end
end

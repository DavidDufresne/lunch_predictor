defmodule LunchPredictor.Statistics do

  alias LunchPredictor.Lunches

  def prior(provider_id) do
    Lunches.number_of_lunches_with_provider_id(provider_id)/Lunches.number_of_lunches
  end
end

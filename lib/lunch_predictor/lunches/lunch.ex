defmodule LunchPredictor.Lunches.Lunch do
  use Ecto.Schema
  import Ecto.Changeset

  alias LunchPredictor.Lunches.Provider

  schema "lunches" do
    field :date, :date
    belongs_to :provider, Provider

    timestamps()
  end

  @doc false
  def changeset(lunch, attrs) do
    lunch
    |> cast(attrs, [:date, :provider_id])
    |> validate_required([:date, :provider_id])
  end
end

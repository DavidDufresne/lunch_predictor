defmodule LunchPredictor.Lunches.Lunch do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lunches" do
    field :date, :date
    field :provider_id, :id

    timestamps()
  end

  @doc false
  def changeset(lunch, attrs) do
    lunch
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end

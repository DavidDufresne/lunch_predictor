defmodule LunchPredictor.Lunches.Provider do
  use Ecto.Schema
  import Ecto.Changeset

  alias LunchPredictor.Lunches.Lunch

  schema "providers" do
    field :name, :string
    has_many :lunches, Lunch

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

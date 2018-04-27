defmodule LunchPredictor.Lunches.Provider do
  use Ecto.Schema
  import Ecto.Changeset


  schema "providers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

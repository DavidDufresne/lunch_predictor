defmodule LunchPredictor.Lunches.Lunch do
  use Ecto.Schema
  import Ecto.Changeset

  alias LunchPredictor.Lunches.Provider

  schema "lunches" do
    field :date, :date
    field :day_of_week, :integer
    belongs_to :provider, Provider

    timestamps()
  end

  @doc false
  def changeset(lunch, attrs) do
    lunch
    |> cast(attrs, [:date, :provider_id])
    |> set_day_of_week
    |> validate_required([:date, :provider_id, :day_of_week])
  end

  defp set_day_of_week(changeset) do
    date = get_field(changeset, :date)
    put_day_of_week_change(changeset, date)
  end

  defp put_day_of_week_change(changeset, nil) do
    changeset
  end

  defp put_day_of_week_change(changeset, date) do
    put_change(changeset, :day_of_week, Date.day_of_week(date))
  end
end

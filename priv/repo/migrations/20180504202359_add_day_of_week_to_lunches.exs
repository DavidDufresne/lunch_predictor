defmodule LunchPredictor.Repo.Migrations.AddDayOfWeekToLunches do
  use Ecto.Migration

  def change do
    alter table(:lunches) do
      add :day_of_week, :integer
    end
  end
end

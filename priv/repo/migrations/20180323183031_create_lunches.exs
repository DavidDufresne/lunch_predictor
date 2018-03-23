defmodule LunchPredictor.Repo.Migrations.CreateLunches do
  use Ecto.Migration

  def change do
    create table(:lunches) do
      add :date, :date
      add :provider_id, references(:providers, on_delete: :nothing)

      timestamps()
    end

    create index(:lunches, [:provider_id])
  end
end

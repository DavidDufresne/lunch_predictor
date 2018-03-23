defmodule LunchPredictor.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :name, :string

      timestamps()
    end

  end
end

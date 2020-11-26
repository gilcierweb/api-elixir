defmodule ApiElixir.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string, null: false
      add :state_id, references(:states)

      timestamps()
    end
  end
end

defmodule ApiElixir.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string, null: false
      add :country_id, references(:countries)

      timestamps()
    end
  end
end

defmodule ApiElixir.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :abbreviation, :string, null: false
      add :name, :string, null: false

      timestamps()
    end
  end
end

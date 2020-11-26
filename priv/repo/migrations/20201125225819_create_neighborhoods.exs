defmodule ApiElixir.Repo.Migrations.CreateNeighborhoods do
  use Ecto.Migration

  def change do
    create table(:neighborhoods) do
      add :name, :string, null: false
      add :city_id, references(:cities)

      timestamps()
    end
  end
end

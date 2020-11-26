defmodule ApiElixir.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :sku, :string, null: false
      add :quantity, :integer, default: 0
      add :price, :decimal, default: 0.0
      add :price_old, :decimal, default: 0.0
      add :description, :text
      add :store_id, references(:stores)

      timestamps()
    end
  end
end

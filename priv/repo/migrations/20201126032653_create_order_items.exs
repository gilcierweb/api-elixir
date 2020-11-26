defmodule ApiElixir.Repo.Migrations.CreateOrderItems do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :quantity, :integer
      add :unit_price, :decimal
      add :full_unit_price, :decimal
      add :product_id, references(:products)
      add :order_id, references(:orders)

      timestamps()
    end
  end
end

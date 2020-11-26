defmodule ApiElixir.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total_amount, :decimal
      add :total_shipping,:decimal
      add :total_amount_with_shipping, :decimal
      add :paid_amount, :decimal
      add :status, :string
      add :date_created, :naive_datetime
      add :date_closed, :naive_datetime
      add :last_updated, :naive_datetime
      add :expiration_date, :naive_datetime

      add :store_id, references(:stores)
      add :shipping_id, references(:shippings)
      add :customer_id, references(:customers)

      timestamps()
    end
  end
end

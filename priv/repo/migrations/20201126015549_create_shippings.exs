defmodule ApiElixir.Repo.Migrations.CreateShippings do
  use Ecto.Migration

  def change do
    create table(:shippings) do
      add :shipment_type, :string, null: false
      add :date_created, :naive_datetime, null: false
      add :receiver_address_id, references(:receiver_addresses)

      timestamps()
    end
  end
end

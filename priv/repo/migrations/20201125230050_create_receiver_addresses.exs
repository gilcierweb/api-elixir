defmodule ApiElixir.Repo.Migrations.CreateReceiverAddresses do
  use Ecto.Migration

  def change do
    create table(:receiver_addresses) do
      add :address_line, :string, null: false
      add :street_name, :string, null: false
      add :street_number, :string, null: false
      add :comment, :string
      add :zip_code, :integer
      add :latitude, :decimal
      add :longitude, :decimal
      add :receiver_phone, :integer

      add :country_id, references(:countries)
      add :state_id, references(:states)
      add :city_id, references(:cities)
      add :neighborhood_id, references(:neighborhoods)

      timestamps()
    end
  end
end
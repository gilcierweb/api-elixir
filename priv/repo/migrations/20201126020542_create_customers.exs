defmodule ApiElixir.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :nickname, :string, null: false
      add :email, :string, null: false
      add :area_code, :integer
      add :phone_number, :integer
      add :doc_type, :string
      add :doc_number, :integer
      add :receiver_address_id, references(:receiver_addresses)

      timestamps()
    end
  end
end

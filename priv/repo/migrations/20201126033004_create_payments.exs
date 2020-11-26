defmodule ApiElixir.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :installments, :integer
      add :payment_type, :string
      add :status, :string
      add :transaction_amount, :decimal
      add :taxes_amount, :decimal
      add :shipping_cost, :decimal
      add :total_paid_amount, :decimal
      add :installment_amount, :decimal
      add :date_approved, :naive_datetime
      add :date_created, :naive_datetime
      add :payer_id, :integer
      add :order_id, references(:orders)

      timestamps()
    end
  end
end

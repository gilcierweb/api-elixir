defmodule ApiElixir.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :installments, :integer
    field :payment_type, :string
    field :status, :string
    field :transaction_amount, :decimal
    field :taxes_amount, :decimal
    field :shipping_cost, :decimal
    field :total_paid_amount, :decimal
    field :installment_amount, :decimal
    field :date_approved, :naive_datetime
    field :date_created, :naive_datetime
    field :payer_id, :integer
    belongs_to :order, ApiElixir.Order

    timestamps()
  end


  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :installments,
           :payment_type,
           :status,
           :transaction_amount,
           :taxes_amount,
           :shipping_cost,
           :total_paid_amount,
           :installment_amount,
           :date_approved,
           :date_created,
           :payer_id,
         ]
       )
  end
end

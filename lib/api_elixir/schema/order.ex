defmodule ApiElixir.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :total_amount, :decimal
    field :total_shipping, :decimal
    field :total_amount_with_shipping, :decimal
    field :paid_amount, :decimal
    field :status, :string
    field :date_created, :naive_datetime
    field :date_closed, :naive_datetime
    field :last_updated, :naive_datetime
    field :expiration_date, :naive_datetime

    belongs_to :store, ApiElixir.Store
    belongs_to :shipping, ApiElixir.Shipping
    belongs_to :customer, ApiElixir.Customer
    has_many :order_items, ApiElixir.OrderItem
    has_many :payments, ApiElixir.Payment

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :total_amount,
           :total_amount_with_shipping,
           :paid_amount,
           :status,
           :date_created,
           :date_closed,
           :last_updated,
           :expiration_date
         ]
       )
    |> cast_assoc(:order_items)
    |> cast_assoc(:payments)
    |> cast_assoc(:shipping)
#    |> Ecto.build_assoc(:payments)
#    |> Ecto.build_assoc(:order_items)
  end

end

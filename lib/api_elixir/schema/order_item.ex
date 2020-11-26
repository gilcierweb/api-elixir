defmodule ApiElixir.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :quantity, :integer
    field :unit_price, :decimal
    field :full_unit_price, :decimal

    belongs_to :product, ApiElixir.Product
    belongs_to :order, ApiElixir.Order

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :full_unit_price,
           :quantity,
           :unit_price,
           :order_id
         ]
       )
  end
end

defmodule ApiElixir.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiElixir.{Product, Order, Repo}

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
           :order_id,
           :product_id,

         ]
       )
#    |> cast_assoc(:product)
    |> put_assoc(:product, Product.parse_data(params))
    |> cast_assoc(:order)
    |> validate_required(
         [
           :full_unit_price,
           :quantity,
           :unit_price,
         ]
       )
  end

end

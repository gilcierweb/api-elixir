defmodule ApiElixir.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :sku, :string
    field :quantity, :integer
    field :price, :decimal
    field :price_old, :decimal
    field :description, :string
    belongs_to :store, ApiElixir.Store
    has_many :order_items, ApiElixir.OrderItem

    timestamps()
  end

  def changeset(struct, params) do
    params_db = %{"sku" => params["id"], "name" => params["title"]}
    struct
    |> cast(
         params_db,
         [
           :name,
           :sku,
           :quantity,
           :price,
           :price_old,
           :description,
         ]
       )
    |> cast_assoc(:store)
    |> cast_assoc(:order_items)
  end
end

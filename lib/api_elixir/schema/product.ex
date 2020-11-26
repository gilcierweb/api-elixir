defmodule ApiElixir.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :name, :string
    field :sku, :string
    field :quantity, :integer
    field :price, :decimal
    field :price_old, :decimal
    field :description, :text
    belongs_to :store_id, ApiElixir.Store

    timestamps()
  end
end

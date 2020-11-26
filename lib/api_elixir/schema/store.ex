defmodule ApiElixir.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :name, :string

    has_many :products, ApiElixir.Product

    timestamps()
  end
end

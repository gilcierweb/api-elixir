defmodule ApiElixir.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :name, :string

    timestamps()
  end
end

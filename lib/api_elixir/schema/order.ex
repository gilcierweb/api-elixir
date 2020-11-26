defmodule ApiElixir.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :name, :string

    timestamps()
  end
end

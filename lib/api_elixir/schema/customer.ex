defmodule ApiElixir.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :name, :string

    timestamps()
  end
end

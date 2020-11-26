defmodule ApiElixir.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :name, :string

    timestamps()
  end
end

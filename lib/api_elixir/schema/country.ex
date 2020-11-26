defmodule ApiElixir.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :abbreviation, :string
    field :name, :string

    has_many :states, ApiElixir.State
    has_many :receiver_addresses, ApiElixir.ReceiverAddress

    timestamps()
  end
end

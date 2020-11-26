defmodule ApiElixir.State do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :name, :string

    belongs_to :country_id, ApiElixir.Country
    has_many :cities, ApiElixir.City
    has_many :receiver_addresses, ApiElixir.ReceiverAddress

    timestamps()
  end
end

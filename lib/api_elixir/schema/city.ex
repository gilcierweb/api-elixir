defmodule ApiElixir.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :name, :string

    belongs_to :state_id, ApiElixir.State
    has_many :neighborhoods, ApiElixir.Neighborhood
    has_many :receiver_addresses, ApiElixir.ReceiverAddress

    timestamps()
  end
end

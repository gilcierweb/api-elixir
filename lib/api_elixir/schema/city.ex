defmodule ApiElixir.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string

    belongs_to :state, ApiElixir.State
    has_many :neighborhoods, ApiElixir.Neighborhood
    has_many :receiver_addresses, ApiElixir.ReceiverAddress

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :name,
         ]
       )
    |> cast_assoc(:state)
    |> cast_assoc(:receiver_addresses)
    |> cast_assoc(:neighborhoods)
  end
end

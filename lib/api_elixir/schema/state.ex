defmodule ApiElixir.State do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :name, :string

    belongs_to :country, ApiElixir.Country
    has_many :cities, ApiElixir.City
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
    |> cast_assoc(:country)
    |> cast_assoc(:cities)
    |> cast_assoc(:receiver_addresses)
    |> validate_required(
         [
           :name,
         ]
       )
  end
end

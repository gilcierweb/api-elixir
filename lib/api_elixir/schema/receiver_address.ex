defmodule ApiElixir.ReceiverAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receiver_addresses" do
    field :address_line, :string
    field :street_name, :string
    field :street_number
    field :comment, :string
    field :zip_code, :integer
    field :latitude, :decimal
    field :longitude, :decimal
    field :receiver_phone, :integer

    belongs_to :country_id, ApiElixir.Country
    belongs_to :state_id, ApiElixir.State
    belongs_to :city_id, ApiElixir.City
    belongs_to :neighborhood_id, ApiElixir.Neighborhood
    has_many :shippings, ApiElixir.Shipping

    timestamps()
  end
end

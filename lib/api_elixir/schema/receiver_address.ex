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

    belongs_to :country, ApiElixir.Country
    belongs_to :state, ApiElixir.State
    belongs_to :city, ApiElixir.City
    belongs_to :neighborhood, ApiElixir.Neighborhood
    has_many :shippings, ApiElixir.Shipping

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :address_line,
           :street_name,
           :street_number,
           :comment,
           :zip_code,
           :latitude,
           :longitude,
           :receiver_phone,
         ]
       )
    |> receiver_phone_to_integer()
  end

  def receiver_phone_to_integer(changeset) do
    receiver_phone = get_field(changeset, :receiver_phone)

    if is_bitstring(receiver_phone) do
      put_change(changeset, :receiver_phone, String.to_integer(receiver_phone))
    else
      changeset
    end

  end

end

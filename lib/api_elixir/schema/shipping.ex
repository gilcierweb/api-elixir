defmodule ApiElixir.Shipping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shippings" do
    field :shipment_type, :string
    field :date_created, :naive_datetime

    belongs_to :receiver_address, ApiElixir.ReceiverAddress
    has_many :orders, ApiElixir.Order

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(
         params,
         [
           :shipment_type,
           :date_created,
         ]
       )
    |> cast_assoc(:receiver_address)
    |> cast_assoc(:orders)
  end
end

defmodule ApiElixir.Shipping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shippings" do
    field :shipment_type, :string
    field :date_created, :naive_datetime

    belongs_to :receiver_address_id, ApiElixir.ReceiverAddress

    timestamps()
  end
end

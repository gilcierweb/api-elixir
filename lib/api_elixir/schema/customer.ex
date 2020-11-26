defmodule ApiElixir.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :nickname, :string, null: false
    field :email, :string, null: false
    field :area_code, :integer
    field :phone_number, :integer
    field :doc_type, :string
    field :doc_number, :integer
    belongs_to :receiver_address, ApiElixir.ReceiverAddress
    has_many :orders, ApiElixir.Order

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
    |> cast_assoc(:receiver_address)
    |> cast_assoc(:orders)
  end
end

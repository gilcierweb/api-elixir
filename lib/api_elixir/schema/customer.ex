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

    has_many :receiver_addresses, ApiElixir.ReceiverAddress
    has_many :orders, ApiElixir.Order

    timestamps()
  end

    def changeset(struct, params) do
      struct
      |> cast(
           params,
           [
             :first_name,
             :last_name,
             :nickname,
             :email,
             :area_code,
             :phone_number,
             :doc_type,
             :doc_number,
           ]
         )
      |> cast_assoc(:receiver_addresses)
      |> cast_assoc(:orders)
    end

  def parse_data(params) do
    customer = params["buyer"]
    doc_number = String.to_integer(customer["billing_info"]["doc_number"])
    phone_number = String.to_integer(customer["phone"]["number"])
    customer_db = %{
      first_name: customer["first_name"],
      last_name: customer["last_name"],
      nickname: customer["nickname"],
      email: customer["email"],
      area_code: customer["phone"]["area_code"],
      phone_number: phone_number,
      doc_type: customer["billing_info"]["doc_type"],
      doc_number: doc_number,
    }
  end

end

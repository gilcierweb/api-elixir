defmodule ApiElixir.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :abbreviation, :string
    field :name, :string

    has_many :states, ApiElixir.State
    has_many :receiver_addresses, ApiElixir.ReceiverAddress

    timestamps()
  end

  def changeset(struct, params) do
    params_db = %{"abbreviation" => params["id"], "name" => params["name"]}
    struct
    |> cast(
         params_db,
         [
           :abbreviation,
           :name,
         ]
       )
    |> cast_assoc(:states)
    |> cast_assoc(:receiver_addresses)
    |> validate_required(
         [
           :abbreviation,
           :name,
         ]
       )
  end

  def abbreviation_parse(changeset) do
    abbreviation = get_field(changeset, :id)

    if is_bitstring(abbreviation) do
      put_change(changeset, :abbreviation, abbreviation)
    else
      changeset
    end

  end
end

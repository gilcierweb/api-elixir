defmodule ApiElixir.Neighborhood do
  use Ecto.Schema
  import Ecto.Changeset

  schema "neighborhoods" do
    field :name, :string

    belongs_to :city, ApiElixir.City

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
    |> cast_assoc(:city)
    |> validate_required(
         [
           :name,
         ]
       )
  end
end

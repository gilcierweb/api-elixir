defmodule ApiElixir.Neighborhood do
  use Ecto.Schema
  import Ecto.Changeset

  schema "neighborhoods" do
    field :name, :string

    belongs_to :city_id, ApiElixir.City

    timestamps()
  end
end

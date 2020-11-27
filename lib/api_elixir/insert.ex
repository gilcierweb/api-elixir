defmodule ApiElixir.Insert do
  alias ApiElixir.{Order, Repo}

  def create(params) do
    order = Order.changeset(%Order{}, params)
    Repo.insert!(order)
  end

  def add(params) do
    #    json = params |> Jason.decode!(as: params)
    #    data = %Order{json: json}
    #    Repo.insert(data)
  end
end
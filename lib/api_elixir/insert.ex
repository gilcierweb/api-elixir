defmodule ApiElixir.Insert do
  alias ApiElixir.{Order, Store, OrderItem, Payment, Repo}

  def create(params) do
    order = Order.changeset(%Order{}, params)
    order = Repo.insert!(order)
  end

  def add(params) do
    #    json = params |> Jason.decode!(as: params)
    #    data = %Order{json: json}
    #    Repo.insert(data)
  end
end
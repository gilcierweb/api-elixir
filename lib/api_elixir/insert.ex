defmodule ApiElixir.Insert do
  alias ApiElixir.{Order, Repo}

  def create(params) do
    order = Order.changeset(%Order{}, params)
    Repo.insert!(order)
  end

end
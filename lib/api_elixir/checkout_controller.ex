defmodule ApiElixir.CheckoutController do

  def checkout( conn, _params) do
    params = conn.params
             |> Jason.encode!
             |> Jason.decode!

#    Insert.create(params)
  end

end
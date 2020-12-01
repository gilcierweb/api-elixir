defmodule ApiElixir.Controllers.HomeController do

  def index(conn, _params) do
    params = conn.params
             |> Jason.encode!
             |> Jason.decode!
  end

  def show(conn, _params) do

  end

end
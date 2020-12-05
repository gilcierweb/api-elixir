defmodule ApiElixirPlug do
  use Plug.Builder

  plug Plug.Logger

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> resp(200, "Hello, World!")
    |> send_resp()
  end
end
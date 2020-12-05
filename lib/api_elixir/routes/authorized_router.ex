defmodule ApiElixir.Routes.AuthorizedRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/authorized" do
    send_resp(conn, 200, "Greetings, Program!")
  end

  get "/unauthorized" do
    send_resp(conn, 403, "End of line")
  end

  match _ do
    send_resp(conn, 404, "No authorized route")
  end
end
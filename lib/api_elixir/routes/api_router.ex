defmodule ApiElixir.Routes.APIRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/secret" do
    send_resp(conn, 200, "{backdoor: 'reindeer flotilla'}")
  end

  get "/open" do
    send_resp(conn, 200, "{frontdoor: 'Now that is a big door'}")
  end

  match _ do
    send_resp(conn, 404, "{error: 'No route round', status: 404}")
  end
end

defmodule ApiElixir.Routes.HomeRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  @content_type "application/json"

  get "/" do
    page = EEx.eval_file(
      "web/templates/index.html.eex",
      [name: 'gilcierweb']
    )
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page)
    |> halt
  end

  get "/gilcierweb" do
    url = "https://api.github.com/users/gilcierweb/repos"
    {:ok, response} = HTTPoison.get(url, [], [])
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, response.body)
  end

end
defmodule ApiElixir.Router do
  use Plug.Router
  if Mix.env == :dev do
    use Plug.Debugger
  end
  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )
  plug(:match)
  plug(:dispatch)

  @content_type "application/json"

#  get "/" do
#    conn
#    |> put_resp_content_type(@content_type)
#    |> send_resp(200, message())
#  end
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
    #    GET /users/:username/repos
    url = "https://api.github.com/users/gilcierweb/repos"
    {:ok, response} = HTTPoison.get(url, [], [])
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, response.body)
  end

  get "/create" do
    url = 'https://delivery-center-recruitment-ap.herokuapp.com/'
    header = 'X-Sent: 09h25 - 24/10/19'
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, welcome())
  end

  defp payload do

    Jason.encode!(
      %{
        resquest: ''
      }
    )
  end

  get "/create" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, welcome())
  end

  post "/checkout" do
    #    query = URI.encode_query(conn.params)
    #    url = "https://api.github.com/search/repositories?#{query}"
    url = "https://delivery-center-recruitment-ap.herokuapp.com/"
    headers = ["X-Sent": "09h25 - 24/10/19", "Accept": "Application/json; Charset=utf-8"]
    body_raw = ''
    #    save_db(body_raw)
    body = Jason.encode!(conn.params)
    {:ok, response} = HTTPoison.post("https://delivery-center-recruitment-ap.herokuapp.com/", body, headers)
    #    {:ok, response} = HTTPoison.get(url, [], [])
    send_resp(conn, response.status_code, response.body)
    #    conn
    #    |> put_resp_content_type("application/json")
    #    |> send_resp(response.status_code, response.body)
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  defp render_json(%{status: status} = conn, data) do
    body = 'Jason.encode!(data)'
    conn
    |> put_resp_content_type("application/json")
    |> send_resp((status || 200), body)
  end

  defp message do
    Jason.encode!(
      %{
        response_type: "in_channel",
        text: "Welcome API GilcierWeb"
      }
    )
  end

  defp parse_data(data) do
    #  save_db(data)
  end

  defp parse_create_api(data) do
    #  save_db(data)
    Jason.encode!(
      %{
        response_type: "in_channel",
        text: "GilcierWeb"
      }
    )
  end

  defp welcome do
    Jason.encode!(
      %{
        response_type: "in_channel",
        text: "GilcierWeb"
      }
    )
  end

  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end

end
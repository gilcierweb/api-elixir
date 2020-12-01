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

  alias ApiElixir.{Insert, ParseGateway, CheckoutController}

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

  get "/success" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, success())
  end

  #  post "/checkout", CheckoutController, :checkout
  post "/checkout" do

    params = conn.params
             |> Jason.encode!
             |> Jason.decode!

    Insert.create(params)
    body_parse_raw = ParseGateway.parse_data(params)

    url = "https://delivery-center-recruitment-ap.herokuapp.com/"
    headers = ["X-Sent": "#{date_format()}", "Accept": "Application/json; Charset=utf-8", recv_timeout: 10_000]
    body = Jason.encode!(body_parse_raw)

    {:ok, response} = HTTPoison.post(url, body, headers, ssl: [versions: [:"tlsv1.2"]])
    send_resp(conn, response.status_code, response.body)

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

  defp success do
    Jason.encode!(
      %{
        status: "success",
        text: "Compra realizada com sucesso!"
      }
    )
  end

  def date_format do
    date_current = DateTime.utc_now
    "#{date_current.hour}h#{date_current.minute} - #{date_current.day}/#{date_current.month}/#{date_current.year}"
  end

  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end

end
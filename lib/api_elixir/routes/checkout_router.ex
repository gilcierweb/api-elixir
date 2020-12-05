defmodule ApiElixir.Routes.CheckoutRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  alias ApiElixir.{Order, Repo, Insert, ParseGateway}

  @content_type "application/json"

  post "/" do
    params = conn.params
             |> Jason.encode!
             |> Jason.decode!

    Insert.create(params)
    body_parse_raw = ParseGateway.parse_data(params)

    url = "https://delivery-center-recruitment-ap.herokuapp.com/"
    headers = ["X-Sent": "#{date_format()}", "Accept": "Application/json; Charset=utf-8", recv_timeout: 10_000]
    body = Jason.encode!(body_parse_raw)

    {:ok, response} = HTTPoison.post(
      url,
      body,
      headers,
      ssl: [
        versions: [:"tlsv1.2"]
      ]
    )
    send_resp(conn, response.status_code, response.body)

  end

  get "/success" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, success())
  end

  def date_format do
    date_current = DateTime.utc_now
    "#{date_current.hour}h#{date_current.minute} - #{date_current.day}/#{date_current.month}/#{date_current.year}"
  end

  defp success do
    Jason.encode!(
      %{
        status: "success",
        text: "Compra realizada com sucesso!"
      }
    )
  end
end
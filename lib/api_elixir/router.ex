defmodule ApiElixir.Router do
  use Plug.Router
  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug(:match)
  plug(:dispatch)

  @content_type "application/json"

  get "/" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, message())
  end

  get "/gilcierweb" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(200, welcome())
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  defp message do
    Jason.encode!(
      %{
        response_type: "in_channel",
        text: "Welcome API GilcierWeb"
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
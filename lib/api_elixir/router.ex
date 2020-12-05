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

  alias ApiElixir.Routes.{AuthorizedRouter, APIRouter, CheckoutRouter, HomeRouter}

  forward "/", to: HomeRouter
  forward "/admin", to: AuthorizedRouter
  forward "/api", to: APIRouter
  forward "/checkout", to: CheckoutRouter
  # forward "/", to: ApiElixirPlug

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

  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end

  @template_dir "lib/api_elixir/web/templates"

  def render(%{status: status} = conn, template, assigns \\ []) do
    body =
      @template_dir
      |> Path.join(template)
      |> String.replace_suffix(".html", ".html.eex")
      |> EEx.eval_file(assigns)

    send_resp(conn, (status || 200), body)
  end

  #  def render_json(%{status: status} = conn, data) do
  #    body = Jason.encode!(data)
  #    send_resp(conn, (status || 200), body)
  #  end

end
defmodule ApiElixir.Endpoint do
  use Plug.Router
  use Plug.Debugger
  use Plug.ErrorHandler

  alias ApiElixir.Router

  require Logger

  plug(Plug.Logger, log: :debug)
  plug(:match)

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  forward("/", to: Router)

  get "/ping" do
    send_resp(conn, 200, "pong!")
  end

  # events, otherwise return an error.
  post "/events" do
    {status, body} =
      case conn.body_params do
        %{"events" => events} -> {200, process_events(events)}
        _ -> {422, missing_events()}
      end

    send_resp(conn, status, body)
  end

  defp process_events(events) when is_list(events) do
    # Do some processing on a list of events
    Jason.encode!(%{response:  Jason.encode!})
  end

  defp process_events(_) do
    # If we can't process anything, let them know :)
    Jason.encode!(%{response: "Please Send Some Events!"})
  end

  defp missing_events do
    Jason.encode!(%{error: "Expected Payload: { 'events': [...] }"})
  end

end
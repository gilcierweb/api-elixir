defmodule ApiElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias ApiElixir.Endpoint

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      ApiElixir.Repo,
      # Endpoint
      # Starts a worker by calling: ApiElixir.Worker.start_link(arg)
      # {ApiElixir.Worker, arg}
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Endpoint,
        # Set the port per environment, see ./config/MIX_ENV.exs
        options: [
          port: Application.get_env(:api_elixir, :port)
        ]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiElixir.Supervisor]
    Logger.info("Starting server at http://localhost:#{Application.get_env(:api_elixir, :port)}/")
    Supervisor.start_link(children, opts)
  end
end

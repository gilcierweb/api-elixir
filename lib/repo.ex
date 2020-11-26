defmodule ApiElixir.Repo do
  use Ecto.Repo,
      otp_app: :api_elixir,
      adapter: Ecto.Adapters.Postgres
end

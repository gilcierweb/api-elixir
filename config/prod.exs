use Mix.Config

database_url = System.get_env("DATABASE_URL")

config :api_elixir, port: 80

if String.valid?(database_url) do
  config :api_elixir, ApiElixir.Repo,
         url: database_url
else
  config :api_elixir, ApiElixir.Repo,
         database: "api_elixir_prod",
         username: "postgres",
         password: "postgres",
         hostname: "localhost"
end
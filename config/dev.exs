use Mix.Config

database_url = System.get_env("DATABASE_URL")

config :api_elixir, port: 4000
if String.valid?(database_url) do
  config :api_elixir,
         ApiElixir.Repo,
         url: database_url
else
  config :api_elixir,
         ApiElixir.Repo,
         database: "api_elixir_dev",
         username: "postgres",
         password: "gil123",
         hostname: "localhost"
end

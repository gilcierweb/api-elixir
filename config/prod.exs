use Mix.Config

config :api_elixir, port: 80

config :api_elixir,  ApiElixir.Repo,
       database: "api_elixir_prod",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

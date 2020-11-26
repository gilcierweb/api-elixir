use Mix.Config

config :api_elixir, port: 4000

config :api_elixir, ApiElixir.Repo,
       database: "api_elixir_dev",
       username: "postgres",
       password: "gil123",
       hostname: "localhost"
use Mix.Config

config :api_elixir, port: 4002

config :api_elixir,  ApiElixir.Repo,
       database: "api_elixir_test",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

use Mix.Config

config :api_elixir,
       ecto_repos: [ApiElixir.Repo]

import_config "#{Mix.env()}.exs"

defmodule ApiElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_elixir,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug_cowboy, :postgrex, :ecto, :httpoison],
      mod: {ApiElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:postgrex, "~> 0.15.7"},
      {:ecto_sql, "~> 3.5"},
      {:jason, "~> 1.2"},
      {:plug, "~> 1.11"},
      {:plug_cowboy, "~> 2.4"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

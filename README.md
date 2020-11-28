# API Elixir

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `api_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:api_elixir, "~> 0.1.0"}
  ]
end
```
### Skills
- Elixir
- PostgreSQL

### Setup
https://asdf-vm.com/#/core-manage-asdf

https://github.com/asdf-vm/asdf-erlang

https://github.com/asdf-vm/asdf-elixir

### Get Started
```shell
mix do deps.get, deps.compile, compile
mix ecto.create 
mix ecto.migrate

MIX_ENV=test mix ecto.create
MIX_ENV=test mix ecto.migrate
MIX_ENV=test mix test

iex -S mix

mix run --no-halt # run http://localhost:4000

```
### Routes
```elixir
# get http://localhost:4000
# get http://localhost:4000/gilcierweb
# post http://localhost:4000/checkout # payload order
# get http://localhost:4000/success # success order payment gateway
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/api_elixir](https://hexdocs.pm/api_elixir).

https://gilcierweb.com.br/

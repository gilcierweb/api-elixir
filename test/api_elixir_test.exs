defmodule ApiElixirTest do
  use ExUnit.Case
  doctest ApiElixir

  test "greets the world" do
    assert ApiElixir.hello() == :world
  end
end

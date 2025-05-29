defmodule ExStreamClientTest do
  use ExUnit.Case
  doctest ExStreamClient

  test "greets the world" do
    assert ExStreamClient.hello() == :world
  end
end

defmodule HelloAshTest do
  use ExUnit.Case
  doctest HelloAsh

  test "greets the world" do
    assert HelloAsh.hello() == :world
  end
end

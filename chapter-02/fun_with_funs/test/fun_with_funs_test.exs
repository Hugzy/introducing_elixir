defmodule FunWithFunsTest do
  use ExUnit.Case
  doctest FunWithFuns

  test "greets the world" do
    assert FunWithFuns.hello() == :world
  end
end

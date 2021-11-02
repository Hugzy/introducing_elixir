defmodule RecordsTest do
  use ExUnit.Case
  doctest Records

  test "greets the world" do
    assert Records.hello() == :world
  end
end

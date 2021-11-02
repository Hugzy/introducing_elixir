defmodule FunctionsAndListComprehensionsTest do
  use ExUnit.Case
  doctest FunctionsAndListComprehensions

  test "greets the world" do
    assert FunctionsAndListComprehensions.hello() == :world
  end
end

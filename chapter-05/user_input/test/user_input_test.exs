defmodule UserInputTest do
  use ExUnit.Case
  doctest UserInput

  test "greets the world" do
    assert UserInput.hello() == :world
  end
end

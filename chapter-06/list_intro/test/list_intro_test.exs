defmodule ListIntroTest do
  use ExUnit.Case
  doctest ListIntro

  test "greets the world" do
    assert ListIntro.hello() == :world
  end
end

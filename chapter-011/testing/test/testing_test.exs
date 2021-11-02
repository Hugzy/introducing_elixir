defmodule TestingTest do
  use ExUnit.Case
  doctest Testing

  test "Zero distance gives zero velocity" do
    assert Testing.drop(:earth, 0) == 0
  end
end

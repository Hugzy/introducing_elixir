defmodule ListIntro do
  def run(input) do
    triangle = triangle(input)
    print(triangle)
    triangle
  end

  def print([]) do
    IO.puts("_____")
  end

  def print([h | t]) do
    IO.inspect(h)
    print(t)
  end

  def triangle(rows) do
    triangle([[0,1,0]], 1 ,rows)
  end

  def triangle(list, count, rows) when count >= rows do
    Enum.reverse(list)
  end

  def triangle(list, count, rows) do
    [previous | _] = list
    triangle([add_row(previous) | list], count + 1, rows)
  end

  def add_row(initial) do
    add_row(initial, 0, [])
  end

  def add_row([], 0, final) do
    [0 | final]
  end

  def add_row([h | t], last, new) do
    add_row(t, h, [last + h | new])
  end
end

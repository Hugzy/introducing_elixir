defmodule Recursion do
  def countdown(num) when num > 0 do
    IO.puts("#{num}")
    :timer.sleep(1000)
    countdown(num - 1)
  end

  def countdown(0) do
    IO.puts("Blastoff!")
  end
end

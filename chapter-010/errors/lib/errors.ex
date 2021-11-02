defmodule Errors do
  alias :dbg, as: Dbg
  require Logger

  def run do
    ex1(:earth, 20) |>
    IO.puts()
    ex1(:earth, -20) |>
    IO.puts()
    ex2()
  end

  def drop() do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
        drop()
    end
  end

  defp fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  """
  Using try and catch to handle a possible error
  """
  def ex1(planemo, distance) do
    gravity = case planemo do
       :earth -> 9.8
       :moon -> 1.6
       :mars -> 3.71
    end

    try do
      :math.sqrt(2 * gravity * distance)
    rescue
      error -> error
    end
  end

  """
  Using the logger library to log stuff
  """
  def ex2() do
    Logger.info("This is an informational message")
    Logger.debug("This is a debug message")
    Logger.warn("This is a warning message")
    Logger.error("This is an error message")
  end

  """
  Tracing messages sent between processes
  """
  def ex3() do
    Dbg.tracer()
    pid = spawn(Errors, :drop, [])
    Dbg.p(pid, :m)
    send(pid, {self(), :moon, 20})
  end

  """
  Tracing function calls
  """
  def ex4(num \\ 4) do
    Dbg.tracer()
    Dbg.p(:all, :c)
    Dbg.tpl(Errors, :factorial, [])
    factorial(1, num, 1)
  end

  def factorial(fuel, num, accumulator) when num >= fuel do
    factorial(fuel + 1, num, accumulator * fuel)
  end

  def factorial(_fuel, _num, accumulator) do
    accumulator
  end
end

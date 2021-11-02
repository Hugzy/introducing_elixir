defmodule Processes do
  def run do
    ex5()
  end

  def ex1 do
    receive do
      msg ->
        IO.puts("Received #{msg}")
    end
  end

  def ex2 do
    receive do
      msg -> IO.puts("Received #{msg}")
      ex2()
    end
  end

  def ex3(count) do
    receive do
      msg -> IO.puts("received #{count}: #{msg}")
      ex3(count + 1)
    end
  end

  def ex4(count) do
    new_value = receive do
      msg -> IO.puts("Received #{count}: #{msg}")
      count + 1
    end
    ex4(new_value)
  end

  def ex5 do
    receive do
      x -> IO.puts("Divided to #{x / 2}")
      ex5()
    end
  end

  def ex6() do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
        ex6()
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

  def ex7() do
    drop_pid = spawn(Processes, :ex6, [])
    convert(drop_pid)
  end

  def convert(drop_pid) do
    receive do
      {planemo, distance} ->
        send(drop_pid, {self(), planemo, distance})
        convert(drop_pid)
      {planemo, distance, velocity} ->
        mph_velocity = 2.23 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters")
        IO.puts("yeilds a velocity of #{mph_velocity} mph")
        convert(drop_pid)
    end
  end

  """
  Calling a linked process from a process so failures propogate
  """
  def ex8 do
      spawn_link(Processes, :ex6, []) |>
      convert()
  end

  """
  Trapping a failure, reportin an error, and setting up a new process
  """
  def ex10() do
    Process.flag(:trap_exit, true)
    spawn_link(Processes, :ex6, []) |>
    safe_convert()
  end

  defp safe_convert(drop_pid) do
    receive do
      {planemo, distance} ->
        send(drop_pid, {self(), planemo, distance})
        safe_convert(drop_pid)
      {:EXIT, _pid, _reason} ->
        new_drop_pid = spawn_link(Processes, :ex6, [])
        safe_convert(new_drop_pid)
      {planemo, distance, velocity} ->
        mph_velocity = 2.23 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters")
        IO.puts("yeilds a velocity of #{mph_velocity} mph")
        safe_convert(drop_pid)

    end
  end
end

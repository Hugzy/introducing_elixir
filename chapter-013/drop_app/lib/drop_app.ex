defmodule DropApp do
  use Application
  require DropSup

  def start(_type, _args) do
    IO.puts("Starting the app...")
    {:ok, pid} = DropSup.start_link()
    Process.unlink(pid)
    {:ok, result1} = GenServer.call(DropServer, 60)
    IO.puts("Calculating... -> #{result1}")
    err = GenServer.call(DropServer, -60)
    IO.puts("Crashing... -> #{err}")
    {:ok, result3} = GenServer.call(DropServer, -60)
    IO.puts("Calculating... #{result3}")
  end
end

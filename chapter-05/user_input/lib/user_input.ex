defmodule UserInput do

  def run do
    # getUserInput()
    # getBetterUserInput()
    sigils()
  end

  def getUserInput do
    # Example of multiline strings aswell
    IO.puts("""
    Choose a number between 1 and 3
    """)

    IO.getn("Choose")
  end

  def getBetterUserInput do
    # Example of multiline strings aswell
    IO.puts("""
    Choose a number between 1 and 3
    """)

    IO.gets("Choose > ")
  end

  def sigils do
    IO.puts("These are examples of sigils")


    IO.puts("~s")
    IO.puts(~s"These are examples of sigils")
    IO.puts("~w")
    ~w/These are examples of sigils/

  end

end

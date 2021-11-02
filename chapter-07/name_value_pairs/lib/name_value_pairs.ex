defmodule Nvp do

  defprotocol Valid do
    def valid?(data)
  end

  defmodule Planemo do
    defstruct name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0
  end

  defimpl Valid, for: Planemo do
    def valid?(p) do
      p.gravity >= 0 and p.diameter >= 0 and p.distance_from_sun >= 0
    end
  end

  defmodule Tower do
    defstruct location: "", height: 20, planemo: :earth, name: ""
  end

  def run do
    keywordlists()
    ex2()
    ex3()
    ex4()
    ex5()
  end

  """
  Lists of key-values where the first element is an atom describing the data, and the second element is the data itself
  """
  def keywordlists do
    IO.puts("Examples of declaring keyword lists")
    IO.puts("Long form")
    long_form = [{:earth, 9.8}, {:moon, 1.6}, {:mars, 3.71}]
    IO.inspect(long_form)

    IO.puts("Short form")
    short_form = [earth: 9.8, moon: 1.6, mars: 3.71]
    IO.inspect(short_form)
  end

  "List of tuples with multiple values"
  def ex2 do
    IO.puts("List of tuples with multiple values")
    atomic_info = [{:hydrogen, :H, 1.008}, {:carbon, :C, 12.011}, {:sodium, :Na, 22.99}]
    IO.inspect(atomic_info)

    IO.puts("List.keyfind example")
    List.keyfind(atomic_info, :H, 1) |>
    IO.inspect()

    IO.puts("List.keymember? example")
    List.keymember?(atomic_info, :Na, 1) |>
    IO.puts()

    IO.puts("List.keystore example")
    atomic_info2 = List.keystore(atomic_info, :boron, 0, {:boron, :B, 10.081})
    IO.inspect(atomic_info2)

    """
    List.keyreplace
    List.keydelete
    exists aswell and is used in the same fashion as List.keystore
    """
  end

  """
  Samples of Hash Dictionaries
  """
  def ex3 do
    planemo_hash = Enum.into([earth: 9.8, moon: 1.6, mars: 3.71], HashDict.new())
    IO.inspect(planemo_hash)

    IO.puts("HashDict.has_key :moon")
    HashDict.has_key?(planemo_hash, :moon)


    """
    Getting an invalid key returns nil
    """
    HashDict.get(planemo_hash, :jupiter) |>
    IO.puts()

    """
    Other operations include
    HashDict.get
    HashDict.put_new
    HashDict.put
    HashDict.delete
    """
  end

  """
  Maps
  """
  def ex4 do
    IO.puts("Creating a map")
    #Creating a map
    numbers_map = %{2 => "two", 3 => "three"}
    IO.inspect(numbers_map)

    IO.puts("Altering maps")

    altered_numbers = %{numbers_map | 3 => "four"}
    IO.inspect(altered_numbers)

    %{3 => text} = numbers_map
    IO.puts(text)
  end

  """
  Structs
  Must be placed inside of a modult with a defstruct macro
  """
  def ex5 do
    IO.puts("Default struct")
    default_tower = %Tower{}
    IO.inspect(default_tower)

    IO.puts("Struct with partial or complete values")
    partial_tower = %Tower{location: "Grand Canyon"}
    IO.inspect(partial_tower)

    IO.puts("Pattern matching a struct")
    %{location: where} = partial_tower
    IO.puts("Where? " <> where)

    default_planemo = %Planemo{}
    IO.write("Is valid? ")
    Valid.valid?(default_planemo) |>
    IO.puts()

    non_valid_planemo = %Planemo{name: :weirdworld, gravity: -2.3}
    IO.write("Is valid? ")
    Valid.valid?(non_valid_planemo) |>
    IO.puts()
  end

end

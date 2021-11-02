defmodule Chapter do
  def run do
    p("Ex 1")
    ex1()
    p("Ex 2")
    ex2()
    p("Ex 3")
    ex3()
    p("Ex 4")
    ex4()
  end

  defp p(value) do
    IO.puts("#{value}")
  end

  def ex1 do
    x20 = &(20 * &1)
    tripler(6, x20)
  end

  def tripler(val, func) do
    3 * func.(val)
  end

  def ex2 do
    p("Create a list of values using the start..end notation and mapping each to its product")
    list = Enum.map(1..10, &(&1 * &1))
    IO.inspect(list)
    p("define a custom function to print an element and pass it to Enum.each with the forgoing list")
    print = fn (value) -> IO.puts(" #{value}") end
    Enum.each(list, print)
  end

  """
  Examples of simple list comprehensions
  """
  def ex3 do
    list = Enum.map(1..10, &(&1 * &1))
    p("List comprehensions")

    # Possible to both assign return to a variable or pass it on using the |> operator
    for value <- list, do: value * value
  end

  "Using the List or Enum library"
  def ex4 do
    p("Using the List and Enum library")
    four_bits = fn value -> (value >= 0) and (value < 16) end
    list = [1,2,4,8,16,32]
    p("")
    p("Example of the Enum.filter function")
    Enum.filter(list, four_bits) |>
    IO.inspect()

    p("")

    p("Example of the Enum.any function")
    IO.write("Has number equal to 8 ")
    Enum.any?(list, &(&1 == 8)) |>
    IO.puts()

    p("")

    p("Example of the Enum.all function")
    IO.write("Are all numbers less than 32 ")
    Enum.all?(list, &(&1 < 32)) |>
    IO.puts()

    p("")

    p("Example of the Enum.take_while function")
    take_while_list = 1..10
    Enum.take_while(take_while_list, &(&1 > 5)) |>
    IO.inspect()

    p("")
    p("Example of the Enum.drop_while function")
    drop_while_list = 1..10
    Enum.drop_while(drop_while_list, &(&1 > 5)) |>
    IO.inspect()

    p("")

    # Results may vary based on the direction the list is iterated
    p("Example of the List.foldl function")
    List.foldl(list, 1, &(&1 / &2)) |>
    IO.inspect()

    p("")

    # Results may vary based on the direction the list is iterated
    p("Examples of the List.foldr function")
    List.foldr(list, 1, &(&1 / &2)) |>
    IO.inspect()

    :ok
  end
end

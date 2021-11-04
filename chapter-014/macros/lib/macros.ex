defmodule Macros do
  require FunctionMaker

  FunctionMaker.create_multiplier(:triple,3)

  FunctionMaker.create_functions([{:earth, 9.8}, {:moon, 1.6}, {:mars, 3.71}])

  """
  Example 14.1 Difference between macros and functions
  """
  defmacro m_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end

  def f_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end

  """
  Examples 14.2 redefing logic with macros
  """
  defmacro double(x) do
    {:*, [], [2, x]}
  end

  """
  Examples 14.3 using unquote to ignore parts of a quote
  """
  defmacro double(x) do
    quote do
      2 * unquote(x)
    end
  end

  """
  Examples 14.4 Extending the language???
  """
  defmacro unless(condition, options) do
    IO.puts("Condition #{inspect(condition)}")
    IO.puts("Options #{inspect(options)}")
  end

  """
  Examples 14.5 Programatically create functions(so cool) like source generators
  """
  def test_multipler do
    value = 5
    result = triple(value)
    IO.puts("the triple of #{value} is #{result}")
  end



end

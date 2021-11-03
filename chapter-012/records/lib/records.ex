"""
Example 12.1 Examples of records
"""
defmodule Planemo do
  require Record
  Record.defrecord :planemo, [name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0]
end

defmodule Tower do
  require Record
  Record.defrecord :tower, Tower, [location: "", height: 20, planemo: :earth, name: ""]
end

defmodule Records do
  require Tower
  require Planemo

  """
  Example 12.2 Using records in functions
  """
  def fall_velocity(t = Tower.tower()) do
    fall_velocity(Tower.tower(t, :planemo), Tower.tower(t, :height))
  end

  """
  Example 12.3 Pattern matching with records
  """
  def fall_velocity(Tower.tower(planemo: planemo, height: height)) do
    fall_velocity(planemo, height)
  end

  @spec fall_velocity(atom(), number()) :: float()
  def fall_velocity(:earth, distance) do
    :math.sqrt(2 * 9.8 * distance)
  end

  @spec fall_velocity(atom(), number()) :: float()
  def fall_velocity(:moon, distance) do
    :math.sqrt(2 * 1.6 * distance)
  end

  @spec fall_velocity(atom(), number()) :: float()
  def fall_velocity(:mars, distance) do
    :math.sqrt(2 * 3.71 * distance)
  end

  def setup() do
    planemo_table = :ets.new(:planemos, [:named_table, {:keypos, Planemo.planemo(:name) + 1}])
    :ets.info(planemo_table)
  end

end

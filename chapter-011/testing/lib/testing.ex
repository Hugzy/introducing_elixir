defmodule Testing do

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


  def wrongness() do
    total_distance = fall_velocity(:earth, 20) +
    fall_velocity(:moon, 20) +
    fall_velocity(:jupiter, 20)
  end

  def drop(planemo, distance) do
    gravity = case planemo do
      :earth -> 9.8
      :moon -> 1.6
      :mars -> 3.41
    end
    :math.sqrt(2 * gravity * distance)
  end

end

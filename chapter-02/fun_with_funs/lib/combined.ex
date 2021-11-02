defmodule Combined do
  import Convert, only: [mps_to_mph: 1]
  import Drop

  def height_to_mph(meters) do
    Drop.fall_velocity(meters) |>
    Convert.mps_to_mph
  end

  def height_to_mph_using_imports(meters) do
    fall_velocity(meters) |>
    mps_to_mph
  end

end

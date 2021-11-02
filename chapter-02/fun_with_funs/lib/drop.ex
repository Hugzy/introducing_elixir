defmodule Drop do
  @moduledoc """
  Documentation for `FunWithFuns`.
  """

  @doc """
  How the code looked before default argument was introduced
    def fall_velocity(distance) do
      :math.sqrt(2 * 9.8 * distance)
    end
  """
  @spec fall_velocity(float(), float()) :: float()
  def fall_velocity(distance, gravity \\ 9.8) do
    :math.sqrt(2 * gravity * distance)
  end


end

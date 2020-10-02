defmodule Drop do

  def planemo_gravity(:earth), do: 9.807
  def planemo_gravity(:moon), do: 1.62
  def planemo_gravity(:mars), do: 3.711

  def fall_velocity(distance, body \\ :earth) do
    gravity = planemo_gravity(body)
    :math.sqrt(2 * gravity * distance)
  end

end

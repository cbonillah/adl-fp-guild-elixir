defmodule Drop do

  def planemo_gravity(:earth), do: 9.807
  def planemo_gravity(:moon), do: 1.62
  def planemo_gravity(:mars), do: 3.711

  @doc """
  Calculates the velocity of an object falling on a planetary body.
  The distance is the height from which the object falls, specified in meters.
  If a planetary body is not specified, earth will be used as a default value.
  """
  def fall_velocity(distance, body \\ :earth) do
    # if distance > 0 do
    unless distance < 0 do
      gravity = planemo_gravity(body)
      :math.sqrt(2 * gravity * distance)
    else
      IO.puts("Distance can't be negative.")
    end
  end

end

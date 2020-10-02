defmodule Importing do
  import Units

  def fall_velocity_in_mph(height) do
    mps_to_mph(Drop.fall_velocity(height))
  end

  def fall_velocity_in_kph(height) do
    mps_to_kph(Drop.fall_velocity(height))
  end

end

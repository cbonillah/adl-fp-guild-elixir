defmodule Units do

  def mps_to_kph(mps), do: mps / 1000 * 360
  def mps_to_mph(mps), do: mps / 1609.34 * 360

end

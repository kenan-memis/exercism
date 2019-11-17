class SpaceAge
  attr_reader :age_in_sec

  EARTH = 365.25
  MERCURY = 0.2408467
  VENUS = 0.61519726
  MARS = 1.8808158
  JUPITER = 11.862615
  SATURN = 29.447498
  URANUS = 84.016846
  NEPTUNE = 164.79132

  def initialize(age_in_sec)
    @age_in_sec = age_in_sec
  end

  def on_earth
    sec_to_days / EARTH
  end

  def on_mercury
    sec_to_days / EARTH / MERCURY
  end

  def on_venus
    sec_to_days / EARTH / VENUS
  end

  def on_mars
    sec_to_days / EARTH / MARS
  end

  def on_jupiter
    sec_to_days / EARTH / JUPITER
  end

  def on_saturn
    sec_to_days / EARTH / SATURN
  end

  def on_uranus
    sec_to_days / EARTH / URANUS
  end

  def on_neptune
    sec_to_days / EARTH / NEPTUNE
  end

  private

  def sec_to_days
    age_in_sec / 60 / 60 / 24
  end
end

# Implement a clock that handles times without dates.
class Clock
  attr_reader :minutes

  class << self
    def at(hours, minutes = 0)
      Clock.new(hour: hours, minute: minutes)
    end
  end

  def initialize(opts)
    @minutes = opts[:hour].to_i * 60 + opts[:minute].to_i
  end

  def to_s
    formatter(hours, mins)
  end

  def +(other)
    Clock.at(0, minutes + other.minutes)
  end

  def -(other)
    Clock.at(0, minutes - other.minutes)
  end

  def ==(other)
    formatter(hours, mins) ==
      formatter(hours(other.minutes), mins(other.minutes))
  end

  private

  def formatter(hours, mins)
    format('%02d:%02d', hours, mins)
  end

  def hours(other_hours = minutes)
    return minutes / 60 % 24 unless other_hours

    other_hours / 60 % 24
  end

  def mins(other_minutes = minutes)
    return minutes % 60 unless other_minutes

    other_minutes % 60
  end
end

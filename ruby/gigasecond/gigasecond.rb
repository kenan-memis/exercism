# Calculate the moment when someone has lived for 10^9 seconds
class Gigasecond
  class << self
    def from(time)
      time + 10**9
    end
  end
end

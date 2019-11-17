# Given a year, report if it is a leap year
class Year
  class << self
    def leap?(year)
      (year % 400).zero? || (year % 4).zero? && year % 100 != 0
    end
  end
end

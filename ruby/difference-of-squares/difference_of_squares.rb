# Find the difference between the square of the sum and
# the sum of the squares of the first N natural numbers
class Squares
  def initialize(number)
    @numbers = 1.upto(number)
  end

  def square_of_sum
    numbers.sum**2
  end

  def sum_of_squares
    numbers.sum { |num| num**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :numbers
end

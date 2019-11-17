# Calculate the number of grains of wheat on a chessboard
# given that the number on each square doubles
class Grains
  class << self
    def square(number)
      raise ArgumentError unless number.between?(1, 64)

      (2**number) / 2
    end

    def total
      (1..64).inject(0) { |sum, number| sum + (2**number) / 2 }
    end
  end
end

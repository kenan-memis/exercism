class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def largest_product(size)
    return 1 if size == 0

    raise_error(size)

    i = 0
    products = []

    loop do
      int_array = number[i, size].chars.map(&:to_i)
      products << int_array.inject(:*) if int_array.length == size
      i+= 1
      break if int_array.length != size
    end

    products.max
  end

  private

  def raise_error(size)
    raise ArgumentError if size > number.length
    raise ArgumentError if number.match(/[A-Za-z]/)
    raise ArgumentError if size < 0
    true
  end
end

class ArgumentError < StandardError; end

class Series
  attr_reader :number

  def initialize(number)
    @number = number.split('')
  end

  def slices(n)
    raise ArgumentError if number.length < n

    result = []
    number.each_cons(n) { |p| result << p.join }
    result
  end
end

# Use the Sieve of Eratosthenes to find all the primes
# from 2 up to a given number
class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    return [] if number == 1

    multiples_array = numbers.inject([]) { |memo, num| memo << multiples(num) }
                             .flatten

    numbers.to_a - multiples_array
  end

  private

  attr_reader :number

  def numbers
    2.upto(number)
  end

  def multiples(num)
    (2..number).inject([]) { |memo, element| memo << element * num }
  end
end

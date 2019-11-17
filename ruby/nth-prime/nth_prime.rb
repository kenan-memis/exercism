# Given a number n, determine what the nth prime is.
class Prime
  class << self
    def nth(number)
      i = 0
      primes = []

      raise ArgumentError if number.zero?

      while primes[number - 1].nil?
        primes << i if prime?(i)
        i += 1
      end

      primes[number - 1]
    end

    def prime?(num)
      return false if num < 2

      2.upto(num - 1) do |n|
        return false if (num % n).zero?
      end
      true
    end
  end
end

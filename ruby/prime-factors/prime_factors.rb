class PrimeFactors
  def self.of(num)
    return [] if num == 1

    prime_factors = []
    i = 2

    loop do
      if num % i == 0
        num = num / i
        prime_factors << i
      else
        i += 1
      end

      break if num == 1
    end

    prime_factors
  end   
end
class CollatzConjecture
  def self.steps(number)
    return 0 if number == 1

    raise ArgumentError if number <= 0

    steps = 0
    
    loop do
      number = number.odd? ? (number * 3) + 1 : number / 2
      steps += 1
      break if number == 1
    end

    steps
  end
end

class ArgumentError < StandardError; end
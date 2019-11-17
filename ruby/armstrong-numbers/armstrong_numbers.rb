class ArmstrongNumbers
  def self.include?(number)
    digits = number.to_i.digits
    power = digits.count

    sum = digits.sum { |d| d**power }

    number == sum
  end
end

# Given a number determine whether or not it is valid per the Luhn formula.
class Luhn
  class << self
    def valid?(number)
      number = number.gsub(/\s/, '')
      number.match?(VALID_DIGITS) && checksum_for(number).modulo(10).zero?
    end

    private

    VALID_DIGITS = /\A\d{2,}\z/

    def double(digit)
      (double = digit * 2) > 9 ? (double - 9) : double
    end

    def checksum_for(number)
      number.chars.reverse.map(&:to_i).each_with_index.map do |digit, index|
        index.even? ? digit : double(digit)
      end.sum
    end
  end
end

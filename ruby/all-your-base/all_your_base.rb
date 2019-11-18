class BaseConverter
  class << self
    def convert(input_base, digits, output_base)
      return digits if input_base == output_base
  
      raise ArgumentError if base_errors(input_base, output_base)
      raise ArgumentError if digit_errors(input_base, digits)
  
      if output_base == 10
        convert_to_decimal(digits, input_base)
      elsif input_base == 10
        convert_to_other(digits, output_base)
      else
        result_digits = convert_to_decimal(digits, input_base)
        convert_to_other(result_digits, output_base)
      end
    end
  
    private
  
    def convert_to_decimal(digits, input_base)
      result = digits.reverse.each.with_index.inject([]) { |arr, (d, index)| arr << d * (input_base ** index); arr }
      result.sum.digits.reverse
    end
  
    def convert_to_other(digits, output_base)
      result_array = []
  
      decimal = digits.join.to_i
  
      loop do
        reminder = decimal % output_base
        division = decimal / output_base
        result_array << reminder
        decimal = division
        break if division == 0
      end
  
      result_array.reverse
    end
  
    def base_errors(input_base, output_base)
      return true if input_base < 2 || output_base < 2
      false
    end
  
    def digit_errors(input_base, digits)
      return true if digits.any? { |d| d.to_i < 0 }
      return true if digits.any? { |d| d >= input_base }
      false
    end
  end
end

class ArgumentError < StandardError; end

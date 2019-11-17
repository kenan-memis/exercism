# Convert a number to a string, the contents of which depend on
# the number's factors
class Raindrops
  MAPPING = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  class << self
    def convert(number)
      factors = (1..number).select { |n| (number % n).zero? }
      matching_factors = [3, 5, 7].select { |item| factors.include?(item) }

      unless matching_factors.empty?
        return matching_factors.map { |i| MAPPING[i].to_s }.join('')
      end

      number.to_s
    end
  end
end

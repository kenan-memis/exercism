# Determine if a sentence is a pangram
class Pangram
  class << self
    def pangram?(sentence)
      chars = sentence.downcase.chars.delete_if { |c| [' ', '_'].include?(c) }

      grouped_list = chars.group_by { |k| k[0] }

      occurrences = grouped_list.each_with_object({}) do |(k, v), memo|
        memo[k] = v.count
      end

      occurrences.select { |k, _v| (97..122).member?(k.ord) }.keys.count == 26
    end
  end
end

# Convert a phrase to its acronym
class Acronym
  class << self
    def abbreviate(phrase)
      phrase.upcase.gsub(/[^a-zA-Z\s]/, ' ').split(' ').collect do |item|
        item[0]
      end.join('')
    end
  end
end

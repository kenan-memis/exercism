# Determine if a word or phrase is an isogram
class Isogram
  class << self
    def isogram?(phrase)
      chars = phrase.downcase.gsub(/[[:punct:]]| /, '').chars
      chars == chars.uniq
    end
  end
end

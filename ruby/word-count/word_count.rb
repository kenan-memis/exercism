# Given a phrase, count the occurrences of each word in that phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    str = phrase.downcase.gsub(/[^0-9A-Za-z']|((?<!\w)'|'(?!\w))/, ' ')

    str.split(' ').each_with_object(Hash.new(0)) { |k, h| h[k] += 1 }
  end

  private

  attr_reader :phrase
end

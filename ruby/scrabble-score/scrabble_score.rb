# Scrabble Game
class Scrabble
  LETTER_VALUES = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    word.to_s.strip.split('').inject(0) { |sum, l| sum + value(l) }
  end

  class << self
    def score(word)
      new(word).score
    end
  end

  private

  attr_reader :word

  def value(letter)
    LETTER_VALUES.each { |k, v| return k unless v.grep(letter.upcase).empty? }
  end
end

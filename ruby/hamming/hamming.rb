# Computations of the Hamming distance between DNA strands
class Hamming
  class << self
    def compute(strand1, strand2)
      raise ArgumentError unless strand1.length == strand2.length

      return 0 if strand1 == strand2

      strand1_chars = strand1.chars
      strand2_chars = strand2.chars

      strand1_chars.zip(strand2_chars).count { |x, y| x != y }
    end
  end
end

class InvalidCodonError < StandardError; end

class Translation
  CODON_PAIRS = [
    ['Methionine', ['AUG']],
    ['Phenylalanine', ['UUU', 'UUC']],
    ['Leucine', ['UUA', 'UUG']],
    ['Serine', ['UCU', 'UCC', 'UCA', 'UCG']],
    ['Tyrosine', ['UAU', 'UAC']],
    ['Cysteine', ['UGU', 'UGC']],
    ['Tryptophan', ['UGG']],
    ['STOP', ['UAA', 'UAG', 'UGA']]
  ].freeze

  def self.of_codon(codon)    
    find_codon(codon)
  end

  def self.of_rna(strand)
    strand_array = strand.chars.each_slice(3).to_a.map(&:join)

    raise InvalidCodonError unless strand_array.all? { |x| CODON_PAIRS.to_h.values.flatten.include?(x) }

    # Translate maximum of 3 strands and neglect 'STOP'
    strand_array.first(3).map {|x| find_codon(x) }.delete_if { |i| i == 'STOP' }
  end

  private

  def self.find_codon(codon)
    CODON_PAIRS.find { |array| array[1].include?(codon) }.first    
  end
end



class Crypto
  <<-TODO
  Replace the last test name from 
  `test_54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces`
  to
  `test_54_character_plaintext_results_in_8_chunks_of_7_characters_the_last_two_with_trailing_spaces`
  TODO

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    return plaintext if plaintext == ''

    normalized_text = plaintext.chars.map { |c| c.downcase.gsub(/\W+/, '') }.join
    normalized_text_length = normalized_text.length

    cols, rows = chunk_decider(normalized_text_length)[0], chunk_decider(normalized_text_length)[1]

    chunks = normalized_text.chars.each_slice(cols).to_a.map(&:join).map do |x|       
      (cols - x.length) > 0 ? x += " " * (cols - x.length) : x
    end

    chunks.map(&:chars).transpose.map(&:join).join(' ')
  end  

  private

  attr_reader :plaintext

  def chunk_decider(num_length) # => [cols, rows]
    (0..num_length).to_a.repeated_permutation(2).select {|x| x.first >= x.last && x.first - x.last <= 1 && x.first * x.last >= num_length}.first
  end
end

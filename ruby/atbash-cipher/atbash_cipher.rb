class Atbash
  NUMBERS = (0..9).to_a.map(&:to_s)

  def self.encode(text)
    result = text.downcase.gsub(/\s+|\W+/, "").chars.map do |c| 
      NUMBERS.include?(c) ? c : cipher_chars[plain_chars.index(c)]
    end.join

    result.length > 5 ? group_in_five(result) : result
  end

  def self.decode(text)
    result = text.downcase.gsub(/\s+|\W+/, "").chars.map do |c| 
      NUMBERS.include?(c) ? c : plain_chars[cipher_chars.index(c)]
    end.join
  end

  private

  def self.plain_chars
    latin_alphabet.chars
  end

  def self.cipher_chars
    latin_alphabet.reverse.chars
  end

  def self.latin_alphabet
    'abcdefghijklmnopqrstuvwxyz'
  end

  def self.group_in_five(text)
    text.chars.each_slice(5).to_a.map(&:join).join(' ')
  end
end
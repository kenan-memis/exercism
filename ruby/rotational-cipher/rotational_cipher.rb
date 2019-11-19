class RotationalCipher
  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

  def self.rotate(str, rotation)    
    str.chars.inject([]) do |arr, c|
      arr << shift_string(c, rotation)
      arr
    end.join
  end

  private

  def self.shift_string(char, rotate)
    result = find_index_and_shifted_char(char, rotate)

    return char unless result
    
    result[:shifted_char]
  end

  def self.find_index_and_shifted_char(char, rotate)
    if char.match(/[a-z]/)
      index = ALPHABET.index(char)
      shift_size = (index + rotate) % 26

      { index: index, shifted_char: ALPHABET[shift_size] }
    elsif char.match(/[A-Z]/)
      index = ALPHABET.map(&:upcase).index(char)
      shift_size = (index + rotate) % 26

      { index: index, shifted_char: ALPHABET.map(&:upcase)[shift_size] }
    else
      nil
    end
  end
end

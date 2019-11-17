class IsbnVerifier
  @@reg_ex = /\d-?\d{3}-?\d{5}-?[\d\X]/

  def self.valid?(string)
    correct_patern = !!string.match(@@reg_ex)

    return false unless correct_patern
    return false unless string.split('-').join.length == 10
    
    is_isbn?(string)
  end

  private

  def self.is_isbn?(string)
    num = string.split('-')
                .join
                .chars
                .reverse
                .each
                .with_index
                .inject(0) {|sum, (x, index)| sum + (condition_x(x) * (index + 1)) }

    (num % 11) == 0    
  end

  def self.condition_x(char)
    return 10 if char == 'X'
    char.to_i
  end
end

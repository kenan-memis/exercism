class ResistorColorDuo
  COLORS = {
    0 => 'Black',
    1 => 'Brown',
    2 => 'Red',
    3 => 'Orange',
    4 => 'Yellow',
    5 => 'Green',
    6 => 'Blue',
    7 => 'Violet',
    8 => 'Grey',
    9 => 'White'
  }.freeze

  def self.value(colors)
    return nil if colors.empty?

    result = invalid_colors_check(colors)

    return "invalid color code(s): #{result.join(', ')}" unless result.empty?

    colors.take(2).map { |c| COLORS.key(c.capitalize) }.join.to_i
  end

  def self.invalid_colors_check(colors)
    colors.take(2).each_with_object([]) do |c, memo|
      memo << c unless COLORS.value?(c.capitalize)
    end
  end
end
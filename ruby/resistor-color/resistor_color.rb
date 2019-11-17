class ResistorColor
  # use array indexes as integer representation for color code
  COLORS = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ].freeze

  def self.color_code(color)
    COLORS.index(color)
  end
end

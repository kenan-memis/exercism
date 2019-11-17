class Garden
  attr_reader :rows, :students

  SEEDS = {
    'C' => :clover, 
    'G' => :grass, 
    'R' => :radishes, 
    'V' => :violets
  }.freeze

  DEFAULT_CHILDREN = [
    'alice',
    'bob',
    'charlie',
    'david',
    'eve',
    'fred',
    'ginny',
    'harriet',
    'ileana',
    'joseph',
    'kincaid',
    'larry'
  ].freeze

  def initialize(rows_string, students = DEFAULT_CHILDREN)
    @rows = rows_string.split("\n")

    i = 0
    @students = students.map(&:downcase).sort.inject({}) do |hash, s|        
      hash[s] = i
      i += 2
      hash
    end

    @students.each { |student|
      define_singleton_method student.first do
        seeds(student)
      end
    }
  end

  private

  def seeds(student)
    [0, 1].inject([]) { |result, i| rows[i][student.last, 2].chars.each { |c| result << SEEDS[c] }; result }
  end
end
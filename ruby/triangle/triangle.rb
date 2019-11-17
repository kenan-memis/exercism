class Triangle
  attr_reader :dimensions

  def initialize(dimensions)
    @dimensions = dimensions
  end

  def equilateral?
    is_triangle? && dimensions.uniq.size == 1 && dimensions.first != 0
  end

  def isosceles?    
    is_triangle? && dimensions.combination(2).to_a.any? { |i| i[0] == i[1] }  
  end

  def scalene?
    is_triangle? && all_different?
  end

  private

  def is_triangle?
    triangle_sized? && no_zero_length?
  end

  def triangle_sized?
    sorted_dimensions = dimensions.sort
    !sorted_dimensions.any? { (sorted_dimensions[0] + sorted_dimensions[1]) < sorted_dimensions[2] }  
  end

  def no_zero_length?
    !dimensions.any? { |x| x.zero? }
  end

  def all_different?
    dimensions.uniq.size == 3
  end
end
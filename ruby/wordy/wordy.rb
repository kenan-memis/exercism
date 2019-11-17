class WordProblem
  attr_reader :description

  @@OPERATIONS = %w[plus minus multiplied divided].freeze

  def initialize(description)
    @description = description
  end

  def answer    
    array = description.chop.split(' ').select { |x| @@OPERATIONS.include?(x) || x.to_i != 0 }
    
    raise ArgumentError if array == [] || unknown_operation_exists?(array)

    slicer(array)
  end

  private

  def operations(array)
    num1, op, num2 = array[0].to_i, array[1], array[2].to_i

    case op
    when "plus"
      num1 + num2
    when "minus"
      num1 - num2
    when "multiplied"
      num1 * num2
    when "divided"
      num1 / num2
    end
  end

  def slicer(array)
    a = array.each_slice(3).to_a
    a[0] = operations(a[0])
    a.size == 1 ? a.first : slicer(a.flatten)
  end

  def unknown_operation_exists?(array)
    only_operations = array.reject { |i| i.to_i != 0 }
    return true if only_operations == []

    only_operations.any? { |j| !@@OPERATIONS.include?(j) }
  end
end
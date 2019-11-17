class Array
  def accumulate
    return to_enum(:accumulate) unless block_given?

    each_with_object([]) { |item, memo| memo << yield(item) }
  end
end

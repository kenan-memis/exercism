class Array
  def keep
    return to_enum(:keep) unless block_given?

    each_with_object([]) { |item, memo| memo << item if yield(item) }
  end

  def discard
    return to_enum(:discard) unless block_given?

    each_with_object([]) { |item, memo| memo << item unless yield(item) }
  end
end

class ListOps
  class << self
    def arrays(array)
      count(array)
    end

    def reverser(array)
      new_array = []
      
      count(array).times do
        new_array << array.pop
      end

      new_array
    end

    def concatter(array1, array2)
      new_array = []
      array1.each { |x| new_array << x }
      array2.each { |x| new_array << x }

      new_array
    end

    def mapper(array, &block)
      array.inject([]) { |result, x| result << yield(x); result }
    end

    def filterer(array, &block)
      array.inject([]) { |result, x| result << x if yield(x); result }
    end

    def sum_reducer(array)
      array.inject(0) { |sum, x| sum += x; sum }
    end

    def factorial_reducer(array)
      array.inject(1) { |mult, x| mult *= x; mult }
    end

    private

    def count(array)
      array.inject(0) { |result, i| result += 1; result}
    end
  end
end
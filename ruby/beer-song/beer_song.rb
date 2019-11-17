class BeerSong
  def self.recite(total, down_count)
    print_text(total, down_count)
  end

  private

  def self.total_not_equals_one(total)
    bottle_phrase_line1 = total >= 2 ? 'bottles' : 'bottle'
    bottle_phrase_line2 = total > 2 ? 'bottles' : 'bottle'

    result = <<~TEXT
    #{total} #{bottle_phrase_line1} of beer on the wall, #{total} #{bottle_phrase_line1} of beer.
    Take one down and pass it around, #{total - 1} #{bottle_phrase_line2} of beer on the wall.
    TEXT

    result
  end

  def self.total_equals_one
    result = <<~TEXT
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    TEXT

    result
  end

  def self.zero_bottles
    result = <<~TEXT
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    TEXT

    result
  end

  def self.print_text(total, counter)
    case total
    when 0
      result = zero_bottles
      more_bottles(total, counter, result) if counter > 1
    when 1
      result = total_equals_one
      more_bottles(total, counter, result) if counter > 1
    else
      result = total_not_equals_one(total)
      more_bottles(total, counter, result) if counter > 1
    end

    result
  end

  def self.more_bottles(total, counter, result)
    total -= 1
    counter -= 1
    result << "\n"
    result << print_text(total, counter)
  end
end

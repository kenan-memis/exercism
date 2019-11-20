require 'date'

class Meetup
  DESCRIPTORS = {
    :first => 0,
    :second => 7,
    :third => 14,
    :fourth => 21
  }.freeze
  
  attr_reader :date

  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(name, descriptor)
    if descriptor == :last
      find_last(name)
    elsif descriptor == :teenth
      find_teenth(name)
    else
      find_nth(name, DESCRIPTORS[descriptor])
    end    
  end

  private

  def day_index(name)
    Date::DAYNAMES.index(name.to_s.capitalize)
  end

  def find_nth(name, n)
    if date.wday == day_index(name)
      date + n
    elsif date.wday < day_index(name)        
      date + (day_index(name) - date.wday) + n
    else
      date + (7 - date.wday + day_index(name)) + n
    end
  end

  def find_last(name)
    end_date = Date.new(date.year, date.month, -1)
    if end_date.wday == day_index(name)
      end_date
    elsif end_date.wday < day_index(name)
      end_date - (7 - day_index(name) + end_date.wday )
    else
      end_date - (end_date.wday - day_index(name))
    end
  end

  def find_teenth(name)
    teenth_date = Date.new(date.year, date.month, 13)
    if teenth_date.wday == day_index(name)      
      teenth_date
    elsif teenth_date.wday < day_index(name)            
      teenth_date + (day_index(name) - teenth_date.wday)
    else            
      teenth_date + (7 - teenth_date.wday + day_index(name))
    end
  end
end

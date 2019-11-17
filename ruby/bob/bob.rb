# Talk with Bob
class Bob
  class << self
    def hey(remark)
      remark.strip!

      return 'Fine. Be that way!' if remark.empty?

      return question(remark) if remark.end_with?('?')

      default(remark)
    end

    private

    def question(remark)
      if yelling?(remark)
        "Calm down, I know what I'm doing!"
      else
        'Sure.'
      end
    end

    def default(remark)
      if yelling?(remark)
        'Whoa, chill out!'
      else
        'Whatever.'
      end
    end

    def yelling?(remark)
      remark == remark.upcase && remark =~ /[a-zA-Z]/
    end
  end
end

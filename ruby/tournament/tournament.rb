# Tally the results of a small football competition.
class Tournament
  class << self
    def tally(input)
      return header if no_input?(input)

      header + table(input)
    end

    private

    def header
      "Team                           | MP |  W |  D |  L |  P\n"
    end

    def no_input?(input)
      input.gsub(/^ */, '') == "\n"
    end

    def table(input)
      
    end
  end
end

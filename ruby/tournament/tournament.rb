require 'pry'
class Tournament
  class << self
    def tally(input)
      input = input.gsub(/^ */, '')

      return header if no_input?(input)

      header + table(input)
    end

    private

    def header
      "Team                           | MP |  W |  D |  L |  P\n"
    end

    def no_input?(input)
      input == "\n"
    end

    def table(input)
      input_hash = input.each_line.with_index.inject({}) do |hash, (line, index)| 
        hash[index] = line.split(';').map(&:chomp)
        hash
      end

      team_results = evaluation(input_hash)
      create_table(team_results)
    end

    def evaluation(results)
      teams = {}

      results.values.each do |val|
        home_team = val[0]
        away_team = val[1]
        result = val[2]

        teams = initialize_teams_hash(teams, home_team, away_team)

        table_updates(teams, val)
      end

      teams
    end

    def initialize_teams_hash(teams, home_team, away_team)
      unless teams[home_team]
        teams[home_team] = { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      end

      unless teams[away_team]
        teams[away_team] = { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      end
      teams
    end

    def table_updates(teams, val)
      home_team = val[0]
      away_team = val[1]
      result = val[2]

      case result
      when 'win'
        teams[home_team][:mp] += 1
        teams[home_team][:w] += 1
        teams[home_team][:p] += 3

        teams[away_team][:mp] += 1
        teams[away_team][:l] += 1
      when 'loss'
        teams[home_team][:mp] += 1
        teams[home_team][:l] += 1  

        teams[away_team][:mp] += 1
        teams[away_team][:w] += 1
        teams[away_team][:p] += 3
      when 'draw'
        teams[home_team][:mp] += 1
        teams[home_team][:d] += 1
        teams[home_team][:p] += 1

        teams[away_team][:mp] += 1
        teams[away_team][:d] += 1
        teams[away_team][:p] += 1
      end
    end

    def create_table(team_results)
      result = ''
      team_results = team_results.sort_by {|k, v| [-v[:p], k]}.to_h

      team_results.each do |k, v|
        result << k << " " * (31 - k.length) << "|  #{v[:mp]} |" << "  #{v[:w]} |" << "  #{v[:d]} |" << "  #{v[:l]} |" << "  #{v[:p]}\n"
      end

      result
    end
  end
end

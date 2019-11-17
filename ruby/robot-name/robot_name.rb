# Manage robot factory settings.
class Robot
  class << self
    attr_accessor :used_names

    def forget; end
  end

  @used_names = []

  attr_accessor :name

  def initialize
    @name = generate_name
  end

  def reset
    initialize
  end

  def generate_name
    new_name = [*'A'..'Z'].sample(2).join + rand(999).to_s

    if Robot.used_names.include?(new_name)
      generate_name
    else
      Robot.used_names << new_name
      new_name
    end
  end
end

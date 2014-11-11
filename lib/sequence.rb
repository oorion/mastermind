class Sequence
  attr_reader :colors
  attr_accessor :solution

  def initialize
    @colors = ["r", "g", "b", "y"]
    @solution = randomizer
  end

  def randomizer
    colors.map do
      colors.sample
    end.join
  end

  def solution
    @solution = randomizer
  end
end

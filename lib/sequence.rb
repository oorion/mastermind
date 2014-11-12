class Sequence
  attr_reader :colors, :solution

  def initialize
    @colors = ["r", "g", "b", "y"]
    @solution = randomizer
  end

  def randomizer
    colors.map do
      colors.sample
    end.join
  end
end

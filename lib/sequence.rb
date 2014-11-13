class Sequence
  attr_reader :colors,
              :solution

  def initialize(colors='rgby')
    @colors = colors
    @solution = randomizer
  end

  def randomizer
    colors.chars.map do
      colors.chars.sample
    end.join
  end
end

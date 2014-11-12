class Guess
  attr_reader :player_guess, :possible_colors, :solution_length

  def initialize(player_guess, colors='rbgy', solution_length=4)
    @player_guess = player_guess
    @possible_colors = colors
    @solution_length = solution_length
  end

  def invalid?
    valid_colors = possible_colors
    vc = /[^#{valid_colors}]+/
    player_guess.match(vc)
  end

  def too_short?
    player_guess.length < solution_length
  end

  def too_long?
    player_guess.length > solution_length
  end
end

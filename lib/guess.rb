class Guess
  attr_reader :player_guess,
              :possible_colors,
              :solution_length

  def initialize(player_guess, colors='rgby')
    @player_guess = player_guess
    @possible_colors = colors
    @solution_length = colors.length
  end

  def invalid?
    valid_colors = /[^#{possible_colors}]+/
    player_guess.match(valid_colors)
  end

  def too_short?
    player_guess.length < solution_length
  end

  def too_long?
    player_guess.length > solution_length
  end
end

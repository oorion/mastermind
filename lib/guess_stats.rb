module GuessStats
  def compute_correct_colors(solution, player_guess)
    solution = solution.chars
    player_guess = player_guess.chars
    correct_color_count = 0
    solution.each do |color|
      if player_guess.include?(color)
        player_guess.delete_at(player_guess.index(color))
        correct_color_count += 1
      end
    end
    correct_color_count
  end

  def compute_correct_positions(solution, player_guess)
    solution = solution.chars
    player_guess = player_guess.chars
    solution.zip(player_guess).select do |item|
      item[0] == item[1]
    end.length
  end
end

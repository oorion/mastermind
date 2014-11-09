class Guess
  def player_guess
    convert_user_input
  end

  def get_user_input
    gets.chomp
  end

  def convert_user_input
    raw_guess = get_user_input
    raw_guess.chars
  end
end

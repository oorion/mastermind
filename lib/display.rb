class Display
  attr_reader :welcome,
              :initial_message,
              :invalid_input,
              :instructions,
              :guess_too_short,
              :guess_too_long,
              :play_message,
              :invalid_guess,
              :guess_question,
              :win_question

  def initialize
    @welcome          = "\nWelcome to MASTERMIND\n\n"
    @initial_message  = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @invalid_input    = "Invalid input! Please type (p) for play, (i) for instructions, or (q) for quit."
    @instructions     = "\nThe computer will select a set of four colors at random, duplicates may be possible.\nYour task will be to guess the colors and order in which they are placed.\nYou will be prompted to enter your guess using the first letter of the color, for example [rrbg].\nAfter each guess the correct number of colors guessed, regardless of position, will be displayed.\nThe number of correctly placed colors will also be displayed.\nUsing that information and multiple guesses you will be able to discover the answer and win!\n"
    @guess_too_short  = "Your guess was too short."
    @guess_too_long   = "Your guess was too long."
    @play_message     = "\nI have generated a beginner sequence with four elements made up of: (r)ed,\n(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n"
    @guess_question   = "What's your guess?\n"
    @invalid_guess    = "Invalid guess."
    @win_question     = "\nDo you want to (p)lay again or (q)uit?"
  end

  def guess_stats(player_guess, number_of_correct_colors, number_of_correct_positions)
    "'#{player_guess}' has #{number_of_correct_colors} of the correct elements with #{number_of_correct_positions} in the correct positions"
  end

  def win_message(player_guess, guess_count, minutes, seconds)
    @win_message = "Congratulations!  You guessed the sequence '#{player_guess}' in #{guess_count} guesses over #{minutes} #{minutes == 1 ? 'minute' : 'minutes'},\n#{seconds} seconds."
  end
end

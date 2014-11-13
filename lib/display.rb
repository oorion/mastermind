require 'colorize'

class Display
  COLORS = {
    "r" => "(#{"r".colorize(:red)})ed",
    "g" => "(#{"g".colorize(:green)})reen",
    "b" => "(#{"b".colorize(:blue)})lue",
    "y" => "(#{"y".colorize(:yellow)})ellow",
    "w" => "(#{"w".colorize(:white)})hite",
    "c" => "(#{"c".colorize(:cyan)})yan",
    "m" => "(#{"m".colorize(:magenta)})agenta"
    }

  GUESS_COLORS =  {
    "r" => "#{"R".colorize(:red)}",
    "g" => "#{"G".colorize(:green)}",
    "b" => "#{"B".colorize(:blue)}",
    "y" => "#{"Y".colorize(:yellow)}",
    "w" => "#{"W".colorize(:white)}",
    "c" => "#{"C".colorize(:cyan)}",
    "m" => "#{"M".colorize(:magenta)}"
    }

  attr_reader :welcome,
              :initial_message,
              :invalid_input,
              :instructions,
              :guess_too_short,
              :guess_too_long,
              :play_message,
              :invalid_guess,
              :guess_question,
              :win_question,
              :level

  def initialize
    @welcome          = "\nWelcome to...\n" +
"

    _/      _/    _/_/      _/_/_/  _/_/_/_/_/  _/_/_/_/  _/_/_/    _/      _/  _/_/_/  _/      _/  _/_/_/
   _/_/  _/_/  _/    _/  _/            _/      _/        _/    _/  _/_/  _/_/    _/    _/_/    _/  _/    _/
  _/  _/  _/  _/_/_/_/    _/_/        _/      _/_/_/    _/_/_/    _/  _/  _/    _/    _/  _/  _/  _/    _/
 _/      _/  _/    _/        _/      _/      _/        _/    _/  _/      _/    _/    _/    _/_/  _/    _/
_/      _/  _/    _/  _/_/_/        _/      _/_/_/_/  _/    _/  _/      _/  _/_/_/  _/      _/  _/_/_/


".colorize(:blue)

    @initial_message  = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @invalid_input    = "Invalid input! Please type (p) for play, (i) for instructions, or (q) for quit."
    @instructions     =

"\nThe computer will select a set of four, five, or seven colors at random,
depending upon the difficulty level selected.  Duplicates may be possible.
Your task will be to guess the colors and order in which they are placed.
You will be prompted to enter your guess using the first letter of the color,
for example [rbgy].  After each guess the correct number of colors guessed,
regardless of position, will be displayed.  The number of correctly placed
colors will also be displayed.  Using that information and multiple guesses
you will be able to discover the answer and win!\n"

    @guess_too_short  = "Your guess was too short."
    @guess_too_long   = "Your guess was too long."
    @guess_question   = "\nWhat's your guess?\n"
    @invalid_guess    = "Invalid guess."
    @win_question     = "\nDo you want to (p)lay again or (q)uit?"
    @level            = "\nWould you like to play (e)asy, (i)ntermediate, or (h)ard?"
  end

  def determine_play_message(colors)
    possible_colors_message = ""
    colors.chars.each do |color|
      possible_colors_message += COLORS[color] + "\n"
    end
    difficulty_level = {
      'rgby' => 'beginner',
      'rgbyw' => 'intermediate',
      'rgbywcm' => 'expert'
    }
    @play_message = "\nI have generated a#{'n' if difficulty_level[colors] == 'intermediate' || difficulty_level[colors] == 'expert'} #{difficulty_level[colors]} sequence with #{colors.length} elements made up of:\n\n#{possible_colors_message}\nUse (q)uit at any time to end the game.\n"
  end

  def guess_stats(player_guess, number_of_correct_colors, number_of_correct_positions, guess_count)
    "'#{player_guess.chars.map { |color| GUESS_COLORS[color]}.join}' has #{number_of_correct_colors} of the correct elements with #{number_of_correct_positions} in the correct positions.\nYou have taken #{ guess_count } guess#{ "es" if guess_count > 1 }"
  end

  def win_message(player_guess, guess_count, minutes, seconds)
    @win_message = "Congratulations!  You guessed the sequence '#{player_guess}' in #{guess_count} guesses over #{minutes} #{minutes == 1 ? 'minute' : 'minutes'},\n#{seconds} seconds."
  end
end

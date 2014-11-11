class Display
  attr_reader :welcome, :initial_message, :invalid_input, :instructions, :guess_too_short, :guess_too_long, :play_message, :invalid_guess

  def initialize
    @welcome = "\nWelcome to MASTERMIND\n\n"
    @initial_message = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @invalid_input = "Invalid input! Please type (p) for play, (i) for instructions, or (q) for quit."
    @instructions = "\n The computer will select a set of four colors at random, duplicates may be possible.\n Your task will be to guess the colors and order in which they are placed.\n You will be prompted to enter your guess using the first letter of the color, for example [rrbg].\n After each guess the correct number of colors guessed, regardless of position, will be displayed.\n The number of correctly placed colors will also be displayed.\n Using that information and multiple guesses you will be able to discover the answer and win!\n\n"
    @guess_too_short = "Your guess was too short."
    @guess_too_long = "Your guess was too long."
    @play_message = "\nI have generated a beginner sequence with four elements made up of: (r)ed,\n(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n"
    @invalid_guess = "Invalid guess."
  end
end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/display'

class DisplayTest <Minitest::Test
  def test_display_has_welcome_message
    display = Display.new
    assert_equal "\nWelcome to MASTERMIND\n\n", display.welcome
  end

  def test_display_has_initial_message
    display = Display.new
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", display.initial_message
  end

  def test_display_invalid_input
    display = Display.new
    assert_equal "Invalid input! Please type (p) for play, (i) for instructions, or (q) for quit.", display.invalid_input
  end

  def test_display_has_instructions
    display = Display.new
    assert_equal "\nThe computer will select a set of four colors at random, duplicates may be possible.\nYour task will be to guess the colors and order in which they are placed.\nYou will be prompted to enter your guess using the first letter of the color, for example [rrbg].\nAfter each guess the correct number of colors guessed, regardless of position, will be displayed.\nThe number of correctly placed colors will also be displayed.\nUsing that information and multiple guesses you will be able to discover the answer and win!\n", display.instructions
  end

  def test_display_has_a_guess_too_short_message
    display = Display.new
    assert_equal "Your guess was too short.", display.guess_too_short
  end

  def test_display_has_a_guess_too_long_message
    display = Display.new
    assert_equal "Your guess was too long.", display.guess_too_long
  end

  def test_has_a_play_message
    display = Display.new
    assert_equal "\nI have generated a beginner sequence with four elements made up of: (r)ed,\n(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n", display.play_message
  end
end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/display'

class DisplayTest <Minitest::Test
  def test_display_has_initial_message
    display = Display.new
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", display.initial_message
  end

  def test_display_invalid_input
    display = Display.new
    assert_equal "Invalid input! Please type (p) for play, (i) for instructions, or (q) for quit.", display.invalid_input
  end

  def test_display_has_a_guess_too_short_message
    display = Display.new
    assert_equal "Your guess was too short.", display.guess_too_short
  end

  def test_display_has_a_guess_too_long_message
    display = Display.new
    assert_equal "Your guess was too long.", display.guess_too_long
  end
end

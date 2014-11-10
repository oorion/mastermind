gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'

class MastermindTest <Minitest::Test
  def test_it_has_a_sequence
    mastermind = Mastermind.new
    assert_equal Sequence, mastermind.sequence.class
  end

  def test_it_has_a_guess
    mastermind = Mastermind.new
    assert_equal Guess, mastermind.guess.class
  end

  def test_it_has_a_display
    mastermind = Mastermind.new
    assert_equal Display, mastermind.display.class
  end

  def test_it_has_a_start_method
    mastermind = Mastermind.new
    assert_respond_to mastermind, :start
  end
end

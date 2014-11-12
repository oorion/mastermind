gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest <Minitest::Test
  def test_guess_knows_if_guess_is_invalid
    guess = Guess.new('xxyy')
    assert guess.invalid?
  end

  def test_game_knows_if_guess_is_valid
    guess = Guess.new('rrgg')
    refute guess.invalid?
  end

  def test_when_guess_too_short
    guess = Guess.new('rrg')
    assert guess.too_short?
    end

  def test_when_guess_too_long
    guess = Guess.new('rrggg')
    assert guess.too_long?
  end
end

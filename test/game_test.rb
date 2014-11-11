gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest <Minitest::Test
  def setup
    display = Display.new
    @game = Game.new($stdin, $stdout, display)
  end

  def test_it_has_and_in_stream
    assert_equal $stdin, @game.in_stream
  end

  def test_it_has_and_out_stream
    assert_equal $stdout, @game.out_stream
  end

  def test_it_has_a_sequence
    assert_equal Sequence, @game.sequence.class
  end

  def test_it_has_a_guess
    assert_equal Guess, @game.guess.class
  end

  def test_it_has_a_display
    assert_equal Display, @game.display.class
  end

  def test_it_has_a_play_method
    assert_respond_to @game, :play
  end

  def test_the_win_method_returns_true_if_guess_equals_solution
    guess = Guess.new(nil)
    sequence = Sequence.new
    @game.guess.stub :player_guess, 'rrgg' do
      @game.sequence.stub :solution, 'rrgg' do
        assert @game.win?
      end
    end
  end
end

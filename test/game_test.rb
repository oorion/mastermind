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
    @game.guess = Guess.new('rrgg')
    sequence = Sequence.new
    @game.sequence.stub :solution, 'rrgg' do
      assert @game.win?
    end
  end

  def test_it_has_an_exit_method
    assert_respond_to @game, :exit?
  end

  def test_exit_method_exits_if_q_is_entered
    @game.guess = Guess.new('q')
    assert @game.exit?
  end

  def test_can_process_game_turn
    assert_respond_to @game, :process_game_turn
  end

  def test_game_knows_if_guess_is_invalid
    @game.guess = Guess.new('xxyy')
    assert @game.guess_invalid?
  end

  def test_game_knows_if_guess_is_valid
    @game.guess = Guess.new('rrgg')
    refute @game.guess_invalid?
  end

  def test_when_guess_too_short
    @game.guess = Guess.new('rrg')
    assert @game.guess_too_short?
    end

  def test_when_guess_too_long
    @game.guess = Guess.new('rrggg')
    assert @game.guess_too_long?
  end

  def test_compute_guess_stats

  end
end

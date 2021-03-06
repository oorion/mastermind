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
    @game.sequence.stub :solution, 'rrgg' do
      @game.guess.stub :player_guess, 'rrgg' do
        assert @game.win?
      end
    end
  end

  def test_it_has_an_exit_method
    assert_respond_to @game, :exit?
  end

  def test_exit_method_exits_if_q_is_entered
    @game.guess.stub :player_guess, 'q' do
      assert @game.exit?
    end
  end

  def test_can_process_game_turn
    assert_respond_to @game, :process_game_turn
  end
end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_stats'
require_relative '../lib/guess'
require_relative '../lib/sequence'

class GuessStatsTest <Minitest::Test
  include GuessStats

  def test_can_compute_number_of_correct_colors
    guess = Guess.new('rrgg')
    sequence = Sequence.new
    sequence.stub :solution, 'bbrr' do
      assert_equal 2, compute_correct_colors(sequence.solution, guess.player_guess)
    end
  end

  def test_can_compute_number_of_correct_colors_with_different_output
    guess = Guess.new('rggg')
    sequence = Sequence.new
    sequence.stub :solution, 'brrr' do
      assert_equal 1, compute_correct_colors(sequence.solution, guess.player_guess)
    end
  end

  def test_can_compute_number_of_correct_colors_in_correct_positions
    guess = Guess.new('rrgg')
    sequence = Sequence.new
    sequence.stub :solution, 'rrgb' do
      assert_equal 3, compute_correct_positions(sequence.solution, guess.player_guess)
    end
  end

  def test_can_compute_number_of_correct_colors_in_correct_positions_with_different_output
    guess = Guess.new('yrrb')
    sequence = Sequence.new
    sequence.stub :solution, 'gryb' do
      assert_equal 2, compute_correct_positions(sequence.solution, guess.player_guess)
    end
  end
end

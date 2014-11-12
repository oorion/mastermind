gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_stats'
require_relative '../lib/guess'
require_relative '../lib/sequence'

class GuessStatsTest <Minitest::Test
  def test_can_compute_number_of_correct_colors
    guess = Guess.new('rrgg')
    solution = solution.new
    solution.stub :solution, 'bbrr' do
      assert_equal 2, compute_correct_colors(game.solution, game.guess)
    end
  end

  def test_can_compute_number_of_correct_colors_in_correct_positions
    guess = Guess.new('rrgg')
    solution = solution.new
    solution.stub :solution, 'rrgb' do
      assert_equal 3, compute_correct_colors(game.solution, game.guess)
    end
  end
end

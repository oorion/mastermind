gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest <Minitest::Test

  def test_it_has_a_player_guess
    guess = Guess.new($stdin)
    guess.stub :get_user_input, "rbbr" do
      assert_equal ['r', 'b', 'b', 'r'], guess.player_guess
    end
  end

  def test_it_has_another_player_guess
    guess = Guess.new($stdin)
    guess.stub :get_user_input, "rybr" do
      assert_equal ['r', 'y', 'b', 'r'], guess.player_guess
    end
  end

end

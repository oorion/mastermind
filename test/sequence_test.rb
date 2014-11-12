gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence'

class SequenceTest < Minitest::Test
  def test_sequence_has_colors
    sequence = Sequence.new
    assert_equal ['r','g','b','y'], sequence.colors
  end

  def test_sequence_has_solution
    sequence = Sequence.new
    sequence.stub :randomizer, 'ggbb' do
      assert_equal 'ggbb', sequence.solution
    end
  end

  def test_sequence_has_another_solution
    sequence = Sequence.new
    sequence.stub :randomizer, 'ygbb' do
      assert_equal 'ygbb', sequence.solution
    end
  end

end

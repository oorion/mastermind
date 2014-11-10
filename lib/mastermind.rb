require_relative 'sequence'
require_relative 'guess'
require_relative 'display'

class Mastermind
  attr_reader :sequence, :guess, :display

  def initialize
    @sequence = Sequence.new
    @guess = Guess.new
    @display = Display.new
  end
end

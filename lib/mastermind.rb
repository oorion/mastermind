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

  def start
    loop do
      puts display.initial_message
      input = guess.get_user_input
      case input
      when 'p'
        play
      when 'i'
        puts display.instructions
      when 'q'
        #code to quit
      else
        puts display.invalid_input
      end
    end
  end
end

# mastermind = Mastermind.new.start

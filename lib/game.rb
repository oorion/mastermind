require_relative 'sequence'
require_relative 'guess'
require_relative 'display'

class Game
  attr_reader :in_stream, :out_stream, :sequence, :guess, :display

  def initialize(in_stream, out_stream, display)
    @in_stream = in_stream
    @out_stream = out_stream
    @sequence = Sequence.new
    @guess = Guess.new(in_stream)
    @display = display
  end

  def play
    out_stream.puts display.play_message
    until win? || exit?
      break
    end
  end

  def win?
    guess.player_guess == sequence.solution
  end

  def exit?
    guess.player_guess == 'q' || guess.player_guess == 'quit'
  end
end

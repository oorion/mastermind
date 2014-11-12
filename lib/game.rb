require_relative 'sequence'
require_relative 'guess'
require_relative 'display'

class Game
  attr_reader :in_stream, :out_stream, :sequence, :display
  attr_accessor :guess

  def initialize(in_stream, out_stream, display)
    @in_stream = in_stream
    @out_stream = out_stream
    @sequence = Sequence.new
    @guess = Guess.new('')
    @display = display
  end

  def play
    out_stream.puts display.play_message
    until win? || exit?
      @guess = Guess.new(in_stream.gets.strip)
      process_game_turn
    end
    compute_game_stats
  end

  def process_game_turn
    case
    when guess.invalid?
      out_stream.puts display.invalid_guess
    when guess.too_short?
      out_stream.puts display.guess_too_short
    when guess.too_long?
      out_stream.puts display.guess_too_long
    else
      compute_guess_stats
    end
  end

  def win?
    guess.player_guess == sequence.solution
  end

  def exit?
    guess.player_guess == 'q' || guess.player_guess == 'quit'
  end

  def compute_guess_stats
    puts 'blah'
  end
end

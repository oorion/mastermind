require_relative 'display'
require_relative 'game'

class GameInterface
  attr_reader :command, :display, :in_stream, :out_stream

  def initialize(in_stream, out_stream)
    @command = ''
    @display = Display.new
    @in_stream = in_stream
    @out_stream = out_stream
  end

  def start
    out_stream.puts display.welcome
    until finished?
      out_stream.puts display.initial_message
      @command = in_stream.gets.strip
      process_initial_command
    end
  end

  def process_initial_command
    case
    when play?
      game = Game.new(in_stream, out_stream, display)
      game.play
    when instructions?
      out_stream.puts display.instructions
    when finished?
      puts "finished!"
    else
      out_stream.puts display.invalid_input
    end
  end

  def play?
    command == 'p'
  end

  def instructions?
    command == 'i'
  end

  def finished?
    command == 'q' || command == 'quit'
  end
end

require_relative 'display'
require_relative 'game'

class GameInterface
  attr_reader :command,
              :display,
              :in_stream,
              :out_stream

  def initialize(in_stream, out_stream)
    @command = ''
    @display = Display.new
    @in_stream = in_stream
    @out_stream = out_stream
  end

  def start
    out_stream.puts display.welcome
    out_stream.puts display.initial_message
    until finished?
      @command = in_stream.gets.strip
      process_initial_command
    end
  end

  def process_initial_command
    case
    when play?
      play_game
    when instructions?
      display_instructions
    when finished?
    else
      display_invalid_input_message
    end
  end

  def play_game
    out_stream.puts display.level
    @command = in_stream.gets.strip
    Game.new(in_stream, out_stream, display, selected_level).play
    out_stream.puts display.win_question
  end

  def display_instructions
    out_stream.puts display.instructions
    out_stream.puts display.win_question
  end

  def display_invalid_input_message
    out_stream.puts display.invalid_input
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

  private

  def selected_level
    levels[@command] || default_level
  end

  def levels
    @levels ||= {
      'e' => 'rgby',
      'i' => 'rgbyw',
      'h' => 'rgbywcm'
    }
  end

  def default_level
    'rgby'
  end
end

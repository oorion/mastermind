require_relative 'sequence'
require_relative 'guess'
require_relative 'display'
require_relative 'guess_stats'

class Game
  include GuessStats

  attr_reader :in_stream,
              :out_stream,
              :sequence,
              :display,
              :beginning_time,
              :ending_time,
              :guess_count,
              :guess,
              :colors

  def initialize(in_stream, out_stream, display, colors='rgby')
    @in_stream = in_stream
    @out_stream = out_stream
    @display = display
    @colors = colors
    @sequence = Sequence.new(colors)
    @guess = Guess.new('', colors)
    @guess_count = 0
  end

  def play
    @beginning_time = Time.now
    out_stream.puts display.determine_play_message(colors)
    out_stream.puts display.guess_question
    until win? || exit?
      @guess = Guess.new(in_stream.gets.strip, colors)
      exit! if exit?
      @guess_count += 1
      process_game_turn
    end
    if win?
      @ending_time = Time.now
      compute_game_stats
    end
  end

  def process_game_turn
    case
    when guess.invalid?
      out_stream.puts display.invalid_guess
    when guess.too_short?
      out_stream.puts display.guess_too_short
      system("say -v Kate 'Your guess was too small, like your brain'")
    when guess.too_long?
      out_stream.puts display.guess_too_long
    when win?
      system("say -v Kate 'Congratulations!'")
    when exit?
      exit!
    else
      compute_guess_stats
      system("say -v Kate #{generate_quip}")
    end
    out_stream.puts display.guess_question if (!win? || !exit?)
  end

  def win?
    guess.player_guess == sequence.solution
  end

  def exit?
    system("say -v Kate 'Your parents were right,,,,you are a quitter'") if guess.player_guess == 'q' || guess.player_guess == 'quit'
    guess.player_guess == 'q' || guess.player_guess == 'quit'
  end

  def compute_guess_stats
    number_of_correct_colors = compute_correct_colors(sequence.solution, guess.player_guess)
    number_of_correct_positions = compute_correct_positions(sequence.solution, guess.player_guess)
    out_stream.puts display.guess_stats(guess.player_guess, number_of_correct_colors, number_of_correct_positions)
  end

  def compute_game_stats
    beginning_seconds = convert_to_seconds(beginning_time)
    ending_seconds = convert_to_seconds(ending_time)
    minutes = (ending_seconds - beginning_seconds) / 60
    seconds = (ending_seconds - beginning_seconds) % 60
    out_stream.puts display.win_message(guess.player_guess, guess_count, minutes, seconds)
  end

  def convert_to_seconds(time)
    time.hour * 60 * 60 + time.min * 60 + time.sec
  end

  def generate_quip
    possible_quips = [
      'You are a good example of why some animals eat their young.',
      'Are you even trying?',
      'Why dont you slip into something more comfortable? Like a coma.',
      'I could say nice things about you, but I would rather tell the truth.'
    ]
    possible_quips.sample
  end
end

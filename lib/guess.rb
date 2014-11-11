class Guess
  attr_reader :in_stream

  def initialize(in_stream)
    @in_stream = in_stream
  end

  def player_guess
    convert_user_input
  end

  def get_user_input
    in_stream.gets.strip
  end

  def convert_user_input
    raw_guess = get_user_input
    raw_guess.chars
  end
end

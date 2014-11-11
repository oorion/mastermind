gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_interface'

class GameInterfaceTest <Minitest::Test
  def setup
    @test_stream_in = StringIO.new
    @test_stream_out = StringIO.new
    @game_interface = GameInterface.new(@test_stream_in, @test_stream_out)
  end

  def test_it_has_a_command_attribute
    assert_equal '', @game_interface.command
  end

  def test_it_has_a_display
    assert_equal Display, @game_interface.display.class
  end

  def test_it_has_in_stream
    assert_equal @test_stream_in, @game_interface.in_stream
  end

  def test_it_has_out_stream
    assert_equal @test_stream_out, @game_interface.out_stream
  end

  def test_it_has_a_start_method
    assert_respond_to @game_interface, :start
  end

  def test_it_has_finish_method
    assert_respond_to @game_interface, :finished?
  end

  def test_it_has_a_process_initial_command_method
    assert_respond_to @game_interface, :process_initial_command
  end

  def test_it_has_a_play_method
    assert_respond_to @game_interface, :play?
  end

  def test_it_has_a_instructions_method
    assert_respond_to @game_interface, :instructions?
  end

  def test_it_has_a_finished_method
    assert_respond_to @game_interface, :finished?
  end

end

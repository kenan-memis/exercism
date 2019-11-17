require 'minitest/autorun'
require_relative 'resistor_color_duo'

# Common test data version: 2.1.0 00dda3a
class ResistorColorDuoTest < Minitest::Test
  def test_brown_and_black
    # skip
    assert_equal 10, ResistorColorDuo.value(%w[brown black])
  end

  def test_blue_and_grey
    # skip
    assert_equal 68, ResistorColorDuo.value(%w[blue grey])
  end

  def test_yellow_and_violet
    # skip
    assert_equal 47, ResistorColorDuo.value(%w[yellow violet])
  end

  def test_orange_and_orange
    # skip
    assert_equal 33, ResistorColorDuo.value(%w[orange orange])
  end

  def test_ignore_additional_colors
    # skip
    assert_equal 51, ResistorColorDuo.value(%w[green brown orange])
  end

  def test_capitalized_orange_and_violet
    assert_equal 37, ResistorColorDuo.value(%w[Orange violet])
  end

  def test_empty_input
    assert_nil nil, ResistorColorDuo.value([])
  end

  def test_other_colors_than_color_codes
    assert_equal 'invalid color code(s): purple',
                 ResistorColorDuo.value(%w[purple orange])
  end
end

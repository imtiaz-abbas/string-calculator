require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_returns_zero_for_empty_string
    result = @calculator.add("")
    assert_equal 0, result
  end

  def test_returns_number_for_single_number_string
    result = @calculator.add("1")
    assert_equal 1, result
  end

  def test_returns_for_comma_separated_number_string
    result = @calculator.add("1,2,3")
    assert_equal 6, result
  end

  def test_returns_for_new_line_between_numbers_string
    result = @calculator.add("1\n2,3")
    assert_equal 6, result
  end

  def test_returns_for_numbers_string_with_delimiter
    result = @calculator.add("//;\n1;2")
    assert_equal 3, result
  end

  def test_returns_for_negative_number_string
    exception = assert_raises(StandardError) do
      @calculator.add("-1,2,5")
    end
    assert_equal "Negative numbers not allowed -1", exception.message
  end

  def test_returns_for_multiple_negative_number_string
    exception = assert_raises(StandardError) do
      @calculator.add("-1,2,5,-3,-6")
    end
    assert_equal "Negative numbers not allowed -1,-3,-6", exception.message
  end

  def test_returns_result_for_complex_expression
    assert_equal 9, @calculator.add("1+2,3*2")
  end

  def test_returns_result_for_complex_expression
    assert_equal 12, @calculator.add("1+2+3,3*2")
  end
end

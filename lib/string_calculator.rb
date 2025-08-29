class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    sanitized_numbers = if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
      split_numbers(numbers, delimiter)
    else
      split_numbers(numbers, ",")
    end
    if sanitized_numbers.find { |n| n < 0 }
      raise StandardError, "Negative numbers not allowed #{sanitized_numbers.select { |n| n < 0 }.join(",")}"
    end
    sanitized_numbers.sum
  end

  private

  def split_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}|\n/).map(&:to_i)
  end
end

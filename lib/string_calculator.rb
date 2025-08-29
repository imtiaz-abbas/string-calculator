class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
      split_numbers(numbers, delimiter).sum
    else
      split_numbers(numbers, ",").sum
    end
  end

  private

  def split_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}|\n/).map(&:to_i)
  end
end

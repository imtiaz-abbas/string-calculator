class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    sanitized_numbers = if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
      split_numbers(numbers, delimiter).map(&:to_i)
    else
      nums_after_split = split_numbers(numbers, ",")
      x = nums_after_split.map do |num|
        if num.include? '+'
          num.split("+").map(&:to_i)
        elsif num.include? '*'
          num.split("*").map(&:to_i).reduce(1) {|i, j| i * j}
        else
          num.to_i
        end
      end
      x.flatten
    end
    if sanitized_numbers.find { |n| n < 0 }
      raise StandardError, "Negative numbers not allowed #{sanitized_numbers.select { |n| n < 0 }.join(",")}"
    end
    sanitized_numbers.sum
  end

  private

  def split_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}|\n/)
  end
end

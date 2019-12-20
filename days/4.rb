module SecureContainer
  # check if the number meets all the criteria
  # It is a six-digit number.
  # The value is within the range given in your puzzle input.
  # Two adjacent digits are the same (like 22 in 122345).
  # Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
  # 158126-624574

  def self.how_many_password_combos(input)
    num_start, num_end = input.split('-').map(&:to_i)

    yay_count = 0
    boo_count = 0
    possible_passwords = []

    # go through range of numbers
    num_start.upto(num_end) do |num|
      if possible?(num)
        yay_count += 1
        possible_passwords << num
      else
        boo_count += 1
        # puts "BOO count #{boo_count}"
      end
    end

    # count number of items in the array
    puts "=== Possible combos count: #{yay_count}, #{possible_passwords.count} ==="
  end

  def self.possible?(num)
    (is_6_digits?(num) && adjacent_digits?(num) && increases?(num) && in_range?(num))
  end

  # It is in the range.
  def self.in_range?(num)
    (158126..624574).include?(num)
  end

  # It is a six-digit number.
  def self.is_6_digits?(num)
    num.to_s.length == 6
  end

  # Two adjacent digits are the same (like 22 in 122345).
  def self.adjacent_digits?(num)
    answers = []
    digits = num.to_s.chars.map { |digit| digit.to_i }

    digits.each_with_index do |num, index|
      if index != 5
        first_num = num
        second_num = digits[index+1]
        answer = (first_num == second_num)

        answers << (first_num == second_num)
      end
    end

    answers.include?(true)
  end

  # Going from left to right, the digits never decrease;
  # they only ever increase or stay the same (like 111123 or 135679).
  def self.increases?(num)
    answers = []
    digits = num.to_s.chars.map { |digit| digit.to_i }

    digits.each_with_index do |num, index|
      if index != 5
        first_num = num
        second_num = digits[index+1]
        answer = (second_num >= first_num)
        answers << answer
      end
    end
    !answers.include?(false)
  end
end

SecureContainer.how_many_password_combos('158126-624574');
# 1665

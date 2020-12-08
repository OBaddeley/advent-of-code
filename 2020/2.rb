#!/usr/bin/ruby

# Day 2: Password Philosophy

module PasswordValidator

  def self.how_many_valid_passwords
    valid_password_count = 0

    ARGF.each_line do |line|
      password_array = line.split(" ")
      # get num range
      num_range = password_array[0].split("-")
      # min_num
      min_num = num_range[0].to_i
      # max_num
      max_num = num_range[1].to_i
      # get_letter
      letter = password_array[1].chop
      # get password
      password = password_array[2]

      # check if valid
      # contains letter ?
      next unless password.include?(letter)
      # how many times does it contain the letter?
      letter_count = password.chars.count(letter)
      # contains letter number of times in range?
      valid_password_count += 1 if letter_count.between?(min_num, max_num)
    end
    puts valid_password_count
  end

  def self.toboggan
    valid_password_count = 0

    ARGF.each_line do |line|
      password_array = line.split(" ")
      num_range = password_array[0].split("-")
      min_num = num_range[0].to_i
      max_num = num_range[1].to_i
      letter = password_array[1].chop
      password = password_array[2]

      next unless password.include?(letter)
      # Exactly one of these positions must contain the given letter
      letter_count = 0

      letter_count += 1 if (password[min_num - 1] == letter)
      letter_count += 1 if (password[max_num - 1] == letter)

      valid_password_count += 1 if letter_count == 1
    end
    puts valid_password_count
  end

end # module

# saved input to 2_input.txt
# command: ruby 2.rb 2_input.txt
# 414
# 413


file = ARGF

PasswordValidator.how_many_valid_passwords;
PasswordValidator.toboggan;

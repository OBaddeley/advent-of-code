module GravityAssist

  INPUTS = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,9,19,23,1,23,5,27,2,27,10,31,1,6,31,35,1,6,35,39,2,9,39,43,1,6,43,47,1,47,5,51,1,51,13,55,1,55,13,59,1,59,5,63,2,63,6,67,1,5,67,71,1,71,13,75,1,10,75,79,2,79,6,83,2,9,83,87,1,5,87,91,1,91,5,95,2,9,95,99,1,6,99,103,1,9,103,107,2,9,107,111,1,111,6,115,2,9,115,119,1,119,6,123,1,123,9,127,2,127,13,131,1,131,9,135,1,10,135,139,2,139,10,143,1,143,5,147,2,147,6,151,1,151,5,155,1,2,155,159,1,6,159,0,99,2,0,14,0]

  # before running the program
  def self.restore_pre_alarm_state
    #replace position 1 with the value 12
    INPUTS[1] = 12
    #replace position 2 with the value 2
    INPUTS[2] = 2
  end

  def self.add(current_index)
    puts "add"

    position_one = INPUTS[current_index+1]
    position_two = INPUTS[current_index+2]
    new_value_position = INPUTS[current_index+3]

    new_value = INPUTS[position_one] + INPUTS[position_two]

    INPUTS[new_value_position] = new_value
  end

  def self.multiply(current_index)
    puts "multiply"
    puts INPUTS[0]

    position_one = INPUTS[current_index+1]
    position_two = INPUTS[current_index+2]
    new_value_position = INPUTS[current_index+3]

    new_value = INPUTS[position_one] * INPUTS[position_two]

    INPUTS[new_value_position] = new_value
  end

  def self.run_program(index)
    current_index = index
    opcode = INPUTS[current_index]

    return if opcode == 99
    add(current_index) if opcode == 1
    multiply(current_index) if opcode == 2

    current_index += 4
    puts "current_index #{current_index}"
    run_program(current_index)
  end


  # What value is left at position 0 after the program halts?
  def self.final_position_zero()
    restore_pre_alarm_state
    run_program(0)
    puts " === Position 0: #{INPUTS[0]} === "
  end

end

GravityAssist.final_position_zero();

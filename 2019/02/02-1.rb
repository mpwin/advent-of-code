require './intcode_computer.rb'

program = File.read('input.txt').split(',').map(&:to_i)

puts IntcodeComputer.run(program, 12, 2)

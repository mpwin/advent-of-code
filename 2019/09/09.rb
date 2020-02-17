require './intcode_computer.rb'

program = File.read('input.txt').split(',').map(&:to_i)

IntcodeComputer.run(program)

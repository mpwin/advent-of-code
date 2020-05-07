require './intcode_computer'

input    = File.read('input.txt')
computer = IntcodeComputer.new(input)
blocks   = 0

while !computer.halt? do
  x  = computer.run
  y  = computer.run
  id = computer.run

  blocks += 1 if id == 2
end

puts blocks

require './intcode_computer'

input    = File.read('input.txt')
input[0] = '2'
computer = IntcodeComputer.new(input)
score    = 0
paddle   = 0
ball     = 0

while !computer.halt? do
  x  = computer.run
  y  = computer.run
  id = computer.run
  
  score  = id if x == -1
  paddle = x  if x != -1 && id == 3
  ball   = x  if x != -1 && id == 4

  computer.input( 1) if paddle <  ball
  computer.input( 0) if paddle == ball
  computer.input(-1) if paddle >  ball
end

puts score

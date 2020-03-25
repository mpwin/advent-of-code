require './intcode_computer'

input    = File.read('input.txt')
computer = IntcodeComputer.new(input)
grid     = Hash.new(0)
location = 0+0i
facing   = 0+1i

loop do
  computer.input(grid[location])
  color = computer.run
  turn  = computer.run

  grid[location] = color
  facing   *= (turn == 0 ? 1i : -1i)
  location += facing

  break if computer.halt?
end

puts grid.keys.count

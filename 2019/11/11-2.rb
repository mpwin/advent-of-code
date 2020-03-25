require './intcode_computer'

input    = File.read('input.txt')
computer = IntcodeComputer.new(input)
grid     = Hash.new(0)
location = 0+0i
facing   = 0+1i

grid[location] = 1

loop do
  computer.input(grid[location])
  color = computer.run
  turn  = computer.run

  grid[location] = color
  facing   *= (turn == 0 ? 1i : -1i)
  location += facing

  break if computer.halt?
end

left, right = grid.keys.map(&:real).minmax
bottom, top = grid.keys.map(&:imag).minmax

(bottom..top).reverse_each do |row|
  (left..right).each do |col|
    print grid[Complex(col, row)] == 1 ? '#' : ' '
  end
  puts
end

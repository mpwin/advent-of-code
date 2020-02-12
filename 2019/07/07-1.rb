require './intcode_computer.rb'

program = File.read('input.txt').split(',').map(&:to_i)
signal  = 0

[0, 1, 2, 3, 4].permutation(5).each do |a, b, c, d, e|
  io = IntcodeComputer.new(program, a).run(0)
  io = IntcodeComputer.new(program, b).run(io)
  io = IntcodeComputer.new(program, c).run(io)
  io = IntcodeComputer.new(program, d).run(io)
  io = IntcodeComputer.new(program, e).run(io)

  signal = io if io > signal
end

puts signal

require './intcode_computer.rb'

program = File.read('input.txt').split(',').map(&:to_i)
signal  = 0

[5, 6, 7, 8, 9].permutation(5).each do |a, b, c, d, e|
  amp_a = IntcodeComputer.new(program, a)
  amp_b = IntcodeComputer.new(program, b)
  amp_c = IntcodeComputer.new(program, c)
  amp_d = IntcodeComputer.new(program, d)
  amp_e = IntcodeComputer.new(program, e)

  amps   = [amp_a, amp_b, amp_c, amp_d, amp_e]
  io     = 0
  output = 0

  amps.cycle do |amp|
    io = amp.run(io)

    if io.nil?
      signal = output if output > signal
      break
    end

    output = io if amp == amp_e
  end
end

puts signal

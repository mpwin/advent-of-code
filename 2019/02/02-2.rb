require './intcode_computer.rb'

program = File.read('input.txt').split(',').map(&:to_i)

for noun in 0..99 do
  for verb in 0..99 do
    if IntcodeComputer.run(program, noun, verb) == 19690720
      puts 100 * noun + verb
      return
    end
  end
end

require 'set'

input = File.readlines('input.txt', chomp: true)
visit = Set.new
index = 0
acc   = 0

loop do
  if visit.include? index
    puts acc
    return
  else
    visit << index
  end

  instruction, param = input[index].split

  case instruction
  when 'acc' then acc += param.to_i and index += 1
  when 'jmp' then index += param.to_i
  when 'nop' then index += 1
  end
end

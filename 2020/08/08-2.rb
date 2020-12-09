require 'set'

input    = File.readlines('input.txt', chomp: true)
jmp_list = Set.new
nop_list = Set.new

input.each.with_index do |line, index|
  instruction = line.split.first

  jmp_list << index if instruction == 'jmp'
  nop_list << index if instruction == 'nop'
end

[[jmp_list, 'jmp'], [nop_list, 'nop']].each do |list, type|
  list.each do |list_index|
    visit = Set.new
    index = 0
    acc   = 0

    loop do
      if visit.include? index
        break
      else
        visit << index
      end
    
      instruction, param = input[index].split
    
      case instruction
      when 'acc' then acc += param.to_i and index += 1 
      when 'jmp' then index += (type == 'jmp' && list_index == index ? 1 : param.to_i)
      when 'nop' then index += (type == 'nop' && list_index == index ? param.to_i : 1)
      end

      if index == input.size
        puts acc
        return
      end
    end    
  end
end

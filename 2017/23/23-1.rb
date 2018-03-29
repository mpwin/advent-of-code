instructions = File.open('input.txt').read.lines.map(&:chomp)
registers    = Hash.new(0)
index        = 0
muls         = 0

while index.between?(0, instructions.size - 1) do
  i, x, y = instructions[index].match(/(...) (.) (.*)/)[1..3]
  y       = (y =~ /\d+/ ? y.to_i : registers[y])

  case i
  when 'set' then registers[x]  = y
  when 'sub' then registers[x] -= y
  when 'mul' then registers[x] *= y and muls += 1
  when 'jnz'
    if (x =~ /\d+/ ? x.to_i : registers[x]) != 0
      index += y
      next
    end
  end

  index += 1
end

puts "Answer 1: #{muls}"

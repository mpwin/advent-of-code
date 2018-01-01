instructions = File.open('input.txt').read.lines.map(&:chomp)
registers    = Hash.new(0)
last_sound   = nil
index        = 0

while index.between?(0, instructions.size - 1) do
  i, x, y = instructions[index].match(/(...) (.) ?(.*)/)[1..3]
  y       = (y =~ /\d+/ ? y.to_i : registers[y])

  case i
  when 'add' then registers[x] += y
  when 'mul' then registers[x] *= y
  when 'mod' then registers[x] %= y
  when 'set' then registers[x]  = y
  when 'snd' then last_sound    = registers[x]
  when 'rcv' then break if registers[x] != 0
  when 'jgz'
    if (x =~ /\d+/ ? x.to_i : registers[x]) > 0
      index += y
      next
    end
  end

  index += 1
end

puts "Answer 1: #{last_sound}"

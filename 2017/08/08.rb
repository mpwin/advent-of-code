input     = File.open('input.txt').read
registers = Hash.new(0)
highest   = 0

input.each_line do |line|
  m = line.match(/(\D+) (inc|dec) (.+) if (\D+) (\D+) (.+)/)

  if registers[m[4]].method(m[5]).(m[6].to_i)
    registers[m[1]] += m[2] == 'inc' ? m[3].to_i : -m[3].to_i
    highest          = registers[m[1]] if registers[m[1]] > highest
  end
end

puts 'Answer 1: %s' % registers.values.max
puts 'Answer 2: %s' % highest

mask = nil
mem  = {}

File.foreach('input.txt').each do |line|
  if match = line.match(/mask = ([01X]{36})/)
    mask = match.captures.first
    next
  end

  m, v = line.match(/mem\[(\d+)\] = (\d+)/).captures.map(&:to_i)
  v    = v.to_s(2).rjust(36, '0')
  
  mask.chars.each.with_index do |char, index|
    v[index] = char unless char == 'X'
  end

  mem[m] = v.to_i(2)
end

puts mem.values.sum

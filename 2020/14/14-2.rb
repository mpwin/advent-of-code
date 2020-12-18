mask = nil
mem  = {}

File.foreach('input.txt') do |line|
  if match = line.match(/mask = ([01X]{36})/)
    mask = match.captures.first
    next
  end

  m, v = line.match(/mem\[(\d+)\] = (\d+)/).captures.map(&:to_i)
  m    = m.to_s(2).rjust(36, '0')

  mask.chars.each.with_index do |char, index|
    m[index] = char unless char == '0'
  end

  floating = Array.new(m.count('X'), ['0', '1'])

  floating.shift.product(*floating).each do |f|
    m_copy = m.dup

    m_copy.chars.each.with_index do |char, index|
      m_copy[index] = f.shift if char == 'X'
    end

    mem[m_copy] = v
  end
end

puts mem.values.sum

position  = Complex(0, 0)
direction = Complex(1, 0)

File.foreach('input.txt') do |line|
  action = line.slice!(0)
  value  = line.to_i

  case action
  when 'N' then position += Complex(0, value)
  when 'S' then position -= Complex(0, value)
  when 'E' then position += Complex(value, 0)
  when 'W' then position -= Complex(value, 0)
  when 'L' then (value / 90).times { direction *=  1i }
  when 'R' then (value / 90).times { direction *= -1i }
  when 'F' then position += direction * value
  end
end

puts position.real.abs + position.imag.abs

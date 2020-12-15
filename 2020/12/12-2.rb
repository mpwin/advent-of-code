position = Complex( 0, 0)
waypoint = Complex(10, 1)

File.foreach('input.txt') do |line|
  action = line.slice!(0)
  value  = line.to_i

  case action
  when 'N' then waypoint += Complex(0, value)
  when 'S' then waypoint -= Complex(0, value)
  when 'E' then waypoint += Complex(value, 0)
  when 'W' then waypoint -= Complex(value, 0)
  when 'L' then (value / 90).times { waypoint *=  1i }
  when 'R' then (value / 90).times { waypoint *= -1i }
  when 'F' then position += waypoint * value
  end
end

puts position.real.abs + position.imag.abs

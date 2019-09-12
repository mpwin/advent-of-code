input     = File.open('input.txt').read
direction = 0 + 1i
location  = 0 + 0i

input.scan(/(L|R)(\d+)/).each do |turn, distance|
  case turn
  when 'L' then direction *=  1i
  when 'R' then direction *= -1i
  end

  location += direction * distance.to_i
end

puts location.real.abs + location.imag.abs

direction = 1i
location  = 0i
turns     = { 'L' => 1i, 'R' => -1i }

File.read('input.txt').scan(/(L|R)(\d+)/).each do |turn, distance|
  direction *= turns[turn]
  location  += direction * distance.to_i
end

puts location.real.abs + location.imag.abs

require 'set'

direction = 1i
location  = 0i
visited   = Set.new [location]
turns     = { 'L' => 1i, 'R' => -1i }

File.read('input.txt').scan(/(L|R)(\d+)/).each do |turn, distance|
  direction *= turns[turn]

  distance.to_i.times do
    location += direction

    if visited.include? location
      puts location.real.abs + location.imag.abs
      return
    else
      visited << location
    end
  end
end

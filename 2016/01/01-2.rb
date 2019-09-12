input     = File.open('input.txt').read
direction = 0 + 1i
location  = 0 + 0i
visited   = [location]

input.scan(/(L|R)(\d+)/).each do |turn, distance|
  case turn
  when 'L' then direction *=  1i
  when 'R' then direction *= -1i
  end

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

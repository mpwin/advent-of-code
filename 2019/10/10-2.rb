require 'set'

map, xx, yy = File.readlines('input.txt', chomp: true), nil, nil
asteroids   = []
vaporized   = 0

for row in 0..map.size-1 do
  for col in 0..map.size-1 do
    if map[row][col] == '#'
      detected = Set.new

      for r in 0..map.size-1 do
        for c in 0..map.size-1 do
          if map[r][c] == '#' && (r != row || c != col)
            x, y = c - col, r - row
            gcd  = x.gcd(y)

            detected << [x / gcd, y / gcd]
          end
        end
      end

      if detected.size > asteroids.size
        asteroids = detected.to_a
        xx, yy    = col, row
      end
    end
  end
end

asteroids.sort_by! do |x, y|
  angle = Complex(x, -y).angle * (180 / Math::PI) * -1
  angle < -90 ? angle + 360 : angle
end

asteroids.each do |ax, ay|
  x, y = ax, ay

  while map[yy + y][xx + x] != '#'
    x += ax
    y += ay
  end

  if (vaporized += 1) == 200
    puts ((xx + x) * 100) + (yy + y)
    return    
  end
end

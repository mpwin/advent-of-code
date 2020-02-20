require 'set'

map  = File.readlines('input.txt', chomp: true)
best = 0

for row in 0..map.size-1 do
  for col in 0..map.size-1 do
    if map[row][col] == '#'
      asteroids = Set.new

      for r in 0..map.size-1 do
        for c in 0..map.size-1 do
          if map[r][c] == '#' && (r != row || c != col)
            x, y = c - col, r - row
            gcd  = x.gcd(y)

            asteroids << [x / gcd, y / gcd]
          end
        end
      end

      best = asteroids.size if asteroids.size > best        
    end
  end
end

puts best

input     = 265149
grid      = Hash.new(0)
square    = 0+0i
direction = 1+0i
length    = 1
steps     = length

grid[square] = 1

while input > grid[square] do
  if steps.zero?
    direction *= 1i
    length    += 1 if [1, -1].include? direction.real
    steps     += length
  end

  square += direction

  [1+1i, 1+0i, 1-1i, 0+1i, 0-1i, -1+1i, -1+0i, -1-1i].each do |adjacent|
    grid[square] += grid[square + adjacent]
  end

  steps -= 1
end

puts grid[square]

input  = 265149
rings  = 0
corner = 1

while input > corner do
  rings  += 1
  corner += rings * 8
end

while input <= corner do
  corner -= rings * 2
end

steps = (input - (corner + rings)).abs

puts steps + rings

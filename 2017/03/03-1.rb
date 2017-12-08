input  = 265149
rings  = 0
corner = 1

while input > corner do
  rings  += 1
  corner += rings * 8
end

div = (corner - input) / rings
mod = (corner - input) % rings

steps =
  if div % 2 == 0 && mod == 0
    rings + rings - mod + 1
  elsif div % 2 == 0
    rings + rings - mod
  else
    rings + mod
  end

puts "Answer 1: #{steps}"

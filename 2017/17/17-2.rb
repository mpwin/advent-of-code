input    = 337
position = 0
size     = 1
answer   = nil

for i in 1..50000000 do
  position += input
  position %= size

  answer = i if position == 0

  position += 1
  size     += 1
end

puts "Answer 2: #{answer}"

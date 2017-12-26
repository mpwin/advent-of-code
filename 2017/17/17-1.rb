input  = 337
buffer = [0]

for i in 1..2017 do
  buffer.rotate! input
  buffer.push    i
end

puts "Answer 1: #{buffer.first}"

trees, x = 0, 0

File.foreach('input.txt') do |line|
  trees += 1 if line[x] == '#'

  x += 3
  x %= line.length - 1
end

puts trees

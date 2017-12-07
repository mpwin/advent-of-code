banks  = File.open('input.txt').read.split.map(&:to_i)
cycles = [ banks.join(' ') ]

while cycles.size == cycles.uniq.size do
  blocks       = banks.max
  index        = banks.index(blocks)
  banks[index] = 0

  blocks.times do
    index = (index == banks.size - 1 ? 0 : index + 1)
    banks[index] += 1
  end

  cycles << banks.join(' ')
end

puts "Answer 1: %s" % (cycles.size - 1)
puts "Answer 2: %s" % (cycles.size - 1 - cycles.index(cycles.last))

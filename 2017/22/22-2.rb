def read_input
  input  = File.open('input.txt')
  grid   = Hash.new('.')
  center = 0.0

  input.read.lines.each_with_index do |line, li|
    line.chomp.chars.each_with_index do |char, ci|
      grid[ Complex(ci, -li) ] = char if char == '#'
    end
    center += 0.5
  end

  return [grid, Complex(center.floor, -center.floor)]
end

grid, node = read_input
direction  = 0 + 1i
infections = 0
bursts     = 0

while bursts < 10000000 do
  case grid[node]
  when '.'
    direction  *= 1i
    grid[node]  = 'W'
  when 'W'
    infections += 1
    grid[node]  = '#'
  when '#'
    direction  *= -1i
    grid[node]  = 'F'
  when 'F'
    direction  *= 1i * 1i
    grid.delete(node)
  end

  node   += direction
  bursts += 1
end

puts "Answer 2: #{infections}"

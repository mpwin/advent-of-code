require 'set'

@cubes = Set.new

File.foreach('input.txt').with_index do |line, line_index|
  line.chomp.chars.each.with_index do |char, char_index|
    @cubes << "#{line_index} #{char_index} #{0} #{0}" if char == '#'
  end

  @size = (-1)..(line_index + 1)
end

def neighbors(x, y, z, w)
  active = 0
  n      = [-1, 0, 1]

  n.product(n, n, n).each do |nx, ny, nz, nw|
    next if nx == 0 && ny == 0 && nz == 0 && nw == 0
    active += 1 if @cubes.include?("#{x + nx} #{y + ny} #{z + nz} #{w + nw}")
    return active if active > 3
  end

  return active
end

6.times do
  cubes_copy = @cubes.dup
  n          = @size.to_a

  n.product(n, n, n).each do |x, y, z, w|
    active = neighbors(x, y, z, w)

    cubes_copy.add    "#{x} #{y} #{z} #{w}" if active == 3
    cubes_copy.delete "#{x} #{y} #{z} #{w}" if active != 3 && active != 2
  end

  @cubes = cubes_copy.dup
  @size  = (@size.first - 1)..(@size.last + 1)
end

puts @cubes.size

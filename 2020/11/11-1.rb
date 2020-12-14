grid = File.readlines('input.txt', chomp: true)
rows = grid.size - 1
cols = grid.first.size - 1

loop do
  grid_copy = grid.map(&:dup)

  for row in 0..rows do
    for col in 0..cols do
      adjacent = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      occupied = 0

      adjacent.each do |r, c|
        r += row
        c += col

        next if r < 0 || r > rows || c < 0 || c > cols

        occupied += 1 if grid[r][c] == '#'
      end

      case grid[row][col]
      when 'L' then grid_copy[row][col] = '#' if occupied == 0
      when '#' then grid_copy[row][col] = 'L' if occupied >= 4
      end
    end
  end
  
  if grid == grid_copy
    break
  else
    grid = grid_copy.map(&:dup)
  end
end

puts grid.join.count('#')

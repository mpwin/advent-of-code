grid = File.readlines('input.txt', chomp: true)
rows = grid.size - 1
cols = grid.first.size - 1

loop do
  grid_copy = grid.map(&:dup)

  for row in 0..rows do
    for col in 0..cols do
      adjacent = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      occupied = 0

      adjacent.each do |ra, ca|
        r = row + ra
        c = col + ca

        while !(r < 0 || r > rows || c < 0 || c > cols) do
          occupied += 1 if grid[r][c] == '#'
          break         if grid[r][c] == '#' || grid[r][c] == 'L'

          r += ra
          c += ca
        end
      end

      case grid[row][col]
      when 'L' then grid_copy[row][col] = '#' if occupied == 0
      when '#' then grid_copy[row][col] = 'L' if occupied >= 5
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

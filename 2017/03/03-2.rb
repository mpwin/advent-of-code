input     = 265149
grid      = Hash.new(0)
square    = [0, 0]
direction = [:right, :up, :left, :down]
length    = 1
steps     = length

grid[square.to_s] = 1

while input > grid[square.to_s] do
  if steps.zero?
    direction.rotate!
    length += 1 if [:left, :right].include? direction.first
    steps  += length
  end

  case direction.first
  when :up    then square[1] += 1
  when :down  then square[1] -= 1
  when :left  then square[0] -= 1
  when :right then square[0] += 1
  end

  [-1, 0, 1].repeated_permutation(2).uniq.difference([[0, 0]]).each do |adjacent|
    grid[square.to_s] += grid[square.zip(adjacent).map(&:sum).to_s]
  end

  steps -= 1
end

puts grid[square.to_s]

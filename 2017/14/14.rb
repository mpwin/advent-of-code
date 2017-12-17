input   = 'oundnydw'
grid    = Array.new
marked  = Array.new
used    = 0
regions = 0

for row in 0..127 do
  list      = Array(0..255)
  position  = 0
  skip_size = 0
  lengths   = "#{input}-#{row}".bytes.push(17, 31, 73, 47, 23)

  64.times do
    lengths.each do |length|
      list.rotate(position).take(length).reverse.each do |i|
        list[position] = i
        position       = (position == list.size - 1 ? 0 : position + 1)
      end

      position  += skip_size
      position  -= list.size * (position / list.size)
      skip_size += 1
    end
  end

  dense_hash  = list.each_slice(16).map { |i| i.inject(:^) }
  hexadecimal = dense_hash.map { |i| i.to_s(16).rjust(2, '0') }.join
  output      = hexadecimal.chars.map { |i| i.hex.to_s(2).rjust(4, '0') }.join

  grid << output.chars
  used += output.count('1')
end

for row in 0..127
  for col in 0..127
    next if marked.include?("#{row} #{col}")

    if grid[row][col] == '1'
      regions += 1

      queue = Queue.new
      queue.push [row, col]

      while !queue.empty? do
        r, c    = queue.pop
        marked << "#{r} #{c}"

        if r > 0 and grid[r - 1][c] == '1' and !marked.include?("#{r - 1} #{c}")
          queue.push [r - 1, c]
          marked << "#{r - 1} #{c}"
        end

        if r < 127 and grid[r + 1][c] == '1' and !marked.include?("#{r + 1} #{c}")
          queue.push [r + 1, c]
          marked << "#{r + 1} #{c}"
        end

        if c > 0 and grid[r][c - 1] == '1' and !marked.include?("#{r} #{c - 1}")
          queue.push [r, c - 1]
          marked << "#{r} #{c - 1}"
        end

        if c < 127 and grid[r][c + 1] == '1' and !marked.include?("#{r} #{c + 1}")
          queue.push [r, c + 1]
          marked << "#{r} #{c + 1}"
        end
      end
    else
      marked << "#{row} #{col}"
    end
  end
end

puts "Answer 1: #{used}"
puts "Answer 2: #{regions}"

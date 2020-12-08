high = 0

File.foreach('input.txt') do |line|
  r, c = line.match(/^([F|B]{7})([L|R]{3})$/).captures
  row  = r.gsub(/[FB]/, 'F' => 0, 'B' => 1).to_i(2)
  col  = c.gsub(/[LR]/, 'L' => 0, 'R' => 1).to_i(2)
  seat = (row * 8) + col
  
  high = seat if seat > high
end

puts high

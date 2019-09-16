code     = []
row, col = 2, 2
keypad   = [[nil, nil, '1', nil, nil],
            [nil, '2', '3', '4', nil],
            ['5', '6', '7', '8', '9'],
            [nil, 'A', 'B', 'C', nil],
            [nil, nil, 'D', nil, nil]]

File.open('input.txt').each do |line|
  line.each_char do |char|
    case char
    when 'U' then row -= 1 unless row == 0 || keypad[row - 1][col].nil?
    when 'D' then row += 1 unless row == 4 || keypad[row + 1][col].nil?
    when 'L' then col -= 1 unless col == 0 || keypad[row][col - 1].nil?
    when 'R' then col += 1 unless col == 4 || keypad[row][col + 1].nil?
    end
  end

  code << keypad[row][col]
end

puts code.join

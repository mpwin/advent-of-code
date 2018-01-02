diagram  = File.open('input.txt').read.lines
row, col = 0, diagram.first.index('|')
heading  = :down
letters  = ''
steps    = 0

while heading do
  case heading
  when :up    then row -= 1
  when :down  then row += 1
  when :left  then col -= 1
  when :right then col += 1
  end

  case diagram[row][col]
  when 'A'..'Z'
    letters << diagram[row][col]
  when '+'
    if heading == :up || heading == :down
      heading = (diagram[row][col - 1] != ' ' ? :left : :right)
    else
      heading = (diagram[row - 1][col] != ' ' ? :up : :down)
    end
  when ' '
    heading = nil
  end

  steps += 1
end

puts "Answer 1: #{letters}"
puts "Answer 2: #{steps}"

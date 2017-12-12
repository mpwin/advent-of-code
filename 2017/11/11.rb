input    = File.open('input.txt').read.split(',')
x, y     = 0, 0
furthest = 0

input.each do |direction|
  case direction
  when 'n'  then y += 1
  when 'ne' then x += 1 and y += 1
  when 'se' then x += 1
  when 's'  then y -= 1
  when 'sw' then x -= 1 and y -= 1
  when 'nw' then x -= 1
  end

  furthest = x.abs + y.abs if x.abs + y.abs > furthest
end

puts 'Answer 1: %s' % (x.abs + y.abs)
puts 'Answer 2: %s' % furthest

input = File.readlines('input.txt').collect { |i| i.split(',').map(&:to_i) }
area  = 0

left, right = input.map(&:first).minmax
top, bottom = input.map(&:last).minmax

for x in left..right do
  for y in top..bottom do
    distances = input.sum { |i| (x - i.first).abs + (y - i.last).abs }
    area += 1 if distances < 10000
  end
end

puts area

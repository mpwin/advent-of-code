input = File.readlines('input.txt').collect { |i| i.split(',').map(&:to_i) }
areas = Array.new(input.size, 0)

left, right = input.map(&:first).minmax
top, bottom = input.map(&:last).minmax

for x in left..right do
  for y in top..bottom do
    distances = input.map { |i| (x - i.first).abs + (y - i.last).abs }
    min = distances.min
    areas[distances.index(min)] += 1 if distances.count(min) == 1
  end
end

puts areas.max

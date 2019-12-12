require 'set'

def trace(input)
  location   = 0i
  directions = { 'U' => 1i, 'D' => -1i, 'L' => -1, 'R' => 1 }

  input.scan(/([UDLR])(\d+)/).each do |direction, distance|
    distance.to_i.times do
      location += directions[direction]
      yield location
    end
  end
end

a, b = File.read('input.txt').split

wire_a, intersections_a, steps_a = Set.new, {}, 0
wire_b, intersections_b, steps_b = Set.new, {}, 0

trace(a) { |location| wire_a << location }
trace(b) { |location| wire_b << location }

intersections = wire_a & wire_b

trace(a) do |location|
  steps_a += 1
  intersections_a[location] = steps_a if intersections.include? location
end

trace(b) do |location|
  steps_b += 1
  intersections_b[location] = steps_b if intersections.include? location
end

lowest = intersections.min_by { |i| intersections_a[i] + intersections_b[i] }

puts intersections_a[lowest] + intersections_b[lowest]

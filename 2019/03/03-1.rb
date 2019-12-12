require 'set'

wire_1, wire_2 = File.open('input.txt').map do |input|
  wire       = Set.new
  location   = 0i
  directions = { 'U' => 1i, 'D' => -1i, 'L' => -1, 'R' => 1 }

  input.scan(/([UDLR])(\d+)/).each do |direction, distance|
    distance.to_i.times do
      location += directions[direction]
      wire     << location
    end
  end

  wire
end

closest = (wire_1 & wire_2).min_by { |i| i.real.abs + i.imag.abs }

puts closest.real.abs + closest.imag.abs

sum = 0

File.open('input.txt').each do |line|
  l, w, h = line.split('x').map(&:to_i)
  areas   = [l * w, w * h, h * l]
  sum    += (2 * areas.sum) + areas.min
end

puts sum

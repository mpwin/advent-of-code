feet = 0

File.open('input.txt').each do |line|
  l, w, h = line.split('x').map(&:to_i)
  feet += 2*l*w + 2*w*h + 2*h*l + [l*w, w*h, h*l].min
end

puts feet

feet = 0

File.open('input.txt').each do |line|
  l, w, h = line.split('x').map(&:to_i)
  feet += l*w*h + [l+l+w+w, w+w+h+h, h+h+l+l].min
end

puts feet

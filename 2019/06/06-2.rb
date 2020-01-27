map       = Hash.new([])
transfers = { 'YOU' => 0 }
queue     = ['YOU']

File.open('input.txt').each do |line|
  o1, o2   = line.chop.split(')')
  map[o1] += [o2]
  map[o2] += [o1]
end

while queue.any?
  object = queue.shift

  map[object].each do |adjacent|
    if !transfers[adjacent]
      transfers[adjacent] = transfers[object] + 1
      queue << adjacent
    end
  end
end

puts transfers['SAN'] - 2

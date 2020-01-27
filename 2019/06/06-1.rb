map    = Hash.new([])
orbits = { 'COM' => 0 }
queue  = ['COM']

File.open('input.txt').each do |line|
  obj, orb  = line.chop.split(')')
  map[obj] += [orb]
end

while queue.any?
  object = queue.shift
  queue += map[object]

  map[object].each do |orbit|
    orbits[orbit] = orbits[object] + 1
  end
end

puts orbits.values.sum

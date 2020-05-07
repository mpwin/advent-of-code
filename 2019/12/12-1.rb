moons  = []

File.open('input.txt').each do |line|
  x, y, z = line.scan(/(-?\d+)/).flatten.map(&:to_i)
  moons << { pos: [x, y, z], vel: [0, 0, 0] }
end

1000.times do
  moons.combination(2).each do |m1, m2|
    for axis in 0..2 do
      if m1[:pos][axis] < m2[:pos][axis]
        m1[:vel][axis] += 1
        m2[:vel][axis] -= 1
      end
  
      if m1[:pos][axis] > m2[:pos][axis]
        m1[:vel][axis] -= 1
        m2[:vel][axis] += 1
      end  
    end
  end

  moons.each do |moon|
    for axis in 0..2 do
      moon[:pos][axis] += moon[:vel][axis]
    end
  end
end

energy = moons.sum do |moon|
  moon[:pos].map(&:abs).sum * moon[:vel].map(&:abs).sum
end

puts energy

xs, ys, zs, steps = [], [], [], []

File.open('input.txt').each do |line|
  x, y, z = line.scan(/(-?\d+)/).flatten.map(&:to_i)

  xs << [x, 0]
  ys << [y, 0]
  zs << [z, 0]
end

[xs, ys, zs].each do |axis|
  initial = axis.flatten
  step    = 0

  loop do
    axis.combination(2).each do |m1, m2|
      if m1[0] < m2[0]
        m1[1] += 1
        m2[1] -= 1
      end
  
      if m1[0] > m2[0]
        m1[1] -= 1
        m2[1] += 1
      end  
    end

    axis.each { |m| m[0] += m[1] }
    step += 1

    if initial == axis.flatten
      steps << step
      break
    end
  end
end

puts steps.inject(:lcm)

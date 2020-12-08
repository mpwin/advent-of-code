t1, t2, t3, t4, t5 = 0, 0, 0, 0, 0
x1, x2, x3, x4, x5 = 0, 0, 0, 0, 0

File.foreach('input.txt').with_index do |line, index|
  t1 += 1 if line[x1] == '#'
  t2 += 1 if line[x2] == '#'
  t3 += 1 if line[x3] == '#'
  t4 += 1 if line[x4] == '#'
  t5 += 1 if line[x5] == '#' && index % 2 == 0

  x1 = (x1 + 1) % (line.length - 1)
  x2 = (x2 + 3) % (line.length - 1)
  x3 = (x3 + 5) % (line.length - 1)
  x4 = (x4 + 7) % (line.length - 1)
  x5 = (x5 + 1) % (line.length - 1) if index % 2 == 0
end

puts t1 * t2 * t3 * t4 * t5

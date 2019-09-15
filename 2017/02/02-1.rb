checksum = 0

File.open('input.txt').each do |line|
  integers  = line.split.map(&:to_i)
  checksum += integers.max - integers.min
end

puts checksum

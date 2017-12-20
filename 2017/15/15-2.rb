a, b  = 634, 301
count = 0

5000000.times do
  loop do
    a = (a * 16807) % 2147483647
    break if a % 4 == 0
  end

  loop do
    b = (b * 48271) % 2147483647
    break if b % 8 == 0
  end

  a_bits = a.to_s(2).rjust(16, '0')[-16..-1]
  b_bits = b.to_s(2).rjust(16, '0')[-16..-1]

  count += 1 if a_bits == b_bits
end

puts "Answer 2: #{count}"

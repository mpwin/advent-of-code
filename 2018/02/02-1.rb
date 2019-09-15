twos, threes = 0, 0

File.open('input.txt').each do |line|
  chars = Hash.new(0)

  line.each_char do |char|
    chars[char] += 1
  end

  twos   += 1 if chars.value? 2
  threes += 1 if chars.value? 3
end

puts twos * threes

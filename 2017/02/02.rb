input = File.open('input.txt').read
sum_1 = 0
sum_2 = 0

input.each_line do |line|
  integers  = line.split.map(&:to_i)
  sum_1    += integers.max - integers.min

  while integers.any? do
    j = integers.shift

    integers.each do |i|
      if i % j == 0 || j % i == 0
        sum_2 += [i, j].max / [i, j].min
      end
    end
  end
end

puts "Answer 1: #{sum_1}"
puts "Answer 2: #{sum_2}"

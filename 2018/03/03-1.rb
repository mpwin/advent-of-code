inches = Hash.new 0
regex  = /(\d+),(\d+): (\d+)x(\d+)/

File.open('input.txt').each_line do |line|
  left, top, width, height = line.match(regex).captures.map(&:to_i)

  for x in left..(left + width - 1) do
    for y in top..(top + height - 1) do
      inches["#{x} #{y}"] += 1
    end
  end
end

puts inches.values.count { |v| v > 1 }

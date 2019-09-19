inches = Hash.new(0)

File.open('input.txt').each do |line|
  left, top, width, height = line.scan(/\d+/).last(4).map(&:to_i)

  for x in left..(left + width - 1) do
    for y in top..(top + height - 1) do
      inches["#{x} #{y}"] += 1
    end
  end
end

puts inches.values.count { |v| v >= 2 }

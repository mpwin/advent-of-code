require 'set'

inches   = Hash.new
ids      = Set.new
overlaps = Set.new

File.open('input.txt').each do |line|
  id, left, top, width, height = line.scan(/\d+/).map(&:to_i)
  ids << id

  for x in left..(left + width - 1) do
    for y in top..(top + height - 1) do
      if inches.key?("#{x} #{y}")
        overlaps << id << inches["#{x} #{y}"]
      else
        inches["#{x} #{y}"] = id
      end
    end
  end
end

puts ids.subtract(overlaps).first

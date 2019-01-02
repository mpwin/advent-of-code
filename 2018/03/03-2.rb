inches = Hash.new 0
input  = File.readlines 'input.txt'
regex  = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/

input.each do |line|
  left, top, width, height = line.match(regex).captures.rotate.map(&:to_i)

  for x in left..(left + width - 1) do
    for y in top..(top + height - 1) do
      inches["#{x} #{y}"] += 1
    end
  end
end

input.each do |line|
  id, left, top, width, height = line.match(regex).captures.map(&:to_i)

  catch :overlap do
    for x in left..(left + width - 1) do
      for y in top..(top + height - 1) do
        throw :overlap if inches["#{x} #{y}"] > 1
      end
    end

    puts id
    return
  end
end

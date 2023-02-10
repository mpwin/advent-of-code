lights = Set.new
regexp = /(turn on|turn off|toggle) (\d+,\d+) through (\d+,\d+)/

def coordinates(start, finish)
  Enumerator.new do |yielder|
    for x in start.first..finish.first do
      for y in start.last..finish.last do
        yielder << "#{x},#{y}"
      end
    end
  end
end

File.open('input.txt').each do |line|
  instruction, start, finish = line.match(regexp).captures
  start = start.split(',').map(&:to_i)
  finish = finish.split(',').map(&:to_i)

  case instruction
  when 'turn on'
    for xy in coordinates(start, finish) do
      lights.add(xy)
    end
  when 'turn off'
    for xy in coordinates(start, finish) do
      lights.delete(xy)
    end
  when 'toggle'
    for xy in coordinates(start, finish) do
      lights.include?(xy) ? lights.delete(xy) : lights.add(xy)
    end
  end
end

puts lights.size

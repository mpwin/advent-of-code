lights = Hash.new(0)
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
      lights[xy] += 1
    end
  when 'turn off'
    for xy in coordinates(start, finish) do
      lights[xy] -= 1 if lights[xy] > 0
    end
  when 'toggle'
    for xy in coordinates(start, finish) do
      lights[xy] += 2
    end
  end
end

puts lights.values.sum

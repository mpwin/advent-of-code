input = File.readlines('input.txt').last
ids   = input.split(',').map { |i| i == 'x' ? 1 : i.to_i }
time  = ids.first
add   = time
index = 1

while index < ids.size
  loop do
    if ((time + index) % ids[index]) == 0
      add = ids[0..index].inject(:lcm)
      break
    else
      time += add
    end
  end

  index += 1
end

puts time

input = File.readlines('input.txt')
time  = input.shift.to_i
ids   = input.shift.scan(/(\d+)/).flatten.map(&:to_i)
bus   = nil
wait  = time

ids.each do |id|
  minutes = (id - (time % id)).abs

  if minutes < wait
    bus  = id
    wait = minutes
  end
end

puts bus * wait

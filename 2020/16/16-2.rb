input   = File.new('input.txt')
rules   = {}
ticket  = []
tickets = []

while (line = input.gets) != "\n"
  field, a1, a2, b1, b2 = line.match(/(\D+): (\d+)-(\d+) or (\d+)-(\d+)/).captures

  rules[field] = [(a1.to_i)..(a2.to_i), (b1.to_i)..(b2.to_i)]
end

input.gets

ticket += input.gets.split(',').map(&:to_i)

input.gets
input.gets

positions = Hash.new { |hash, key| hash[key] = [] }

while line = input.gets
  numbers = line.split(',').map(&:to_i)

  tickets << numbers if numbers.all? do |number|
    rules.values.any? do |ranges|
      ranges.first.include?(number) || ranges.last.include?(number)
    end
  end
end

rules.each do |field, ranges|
  for pos in 0..ticket.size-1 do
    positions[field] << pos if tickets.all? do |t|
      ranges.first.include?(t[pos]) || ranges.last.include?(t[pos])
    end
  end
end

while positions.any?
  positions.select { |field, pos| pos.size == 1 }.each do |field, pos|
    rules[field] = pos.first

    positions.values.each { |v| v.delete(pos.first) unless v == pos }
    positions.delete(field)
  end
end

departures = rules.keep_if { |rule, _| rule.match(/departure/) }
answer     = 1

ticket.each.with_index do |number, index|
  answer *= number if departures.values.include?(index)
end

puts answer

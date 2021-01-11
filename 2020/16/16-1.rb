input = File.new('input.txt')
rules = {}
count = 0

while (line = input.gets) != "\n"
  field, a1, a2, b1, b2 = line.match(/(\D+): (\d+)-(\d+) or (\d+)-(\d+)/).captures

  rules[field] = [(a1.to_i)..(a2.to_i), (b1.to_i)..(b2.to_i)]
end

loop { break if input.gets.chomp == 'nearby tickets:' }

while line = input.gets
  numbers = line.split(',').map(&:to_i)

  numbers.each do |number|
    count += number if rules.values.all? do |ranges|
      !(ranges.first.include?(number) || ranges.last.include?(number))
    end
  end
end

puts count

sum = 0

File.open('input.txt').each do |line|
  integers = line.split.map(&:to_i)

  integers.combination(2).each do |pair|
    if pair.max % pair.min == 0
      sum += pair.max / pair.min
      break
    end
  end
end

puts sum

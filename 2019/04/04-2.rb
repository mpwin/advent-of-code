input = 134564..585159
count = 0

input.each do |i|
  digits = i.digits.reverse

  if digits == digits.sort
    digits.uniq.each do |digit|
      count += 1 and break if digits.count(digit) == 2
    end
  end
end

puts count

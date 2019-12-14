input = 134564..585159
count = 0

input.each do |i|
  digits = i.digits.reverse

  if digits == digits.sort
    digits.each_cons(2) do |pair|
      count += 1 and break if pair.first == pair.last
    end  
  end
end

puts count

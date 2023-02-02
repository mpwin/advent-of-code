nice = 0

File.open('input.txt').each do |line|
  rule_1, rule_2 = false, false

  line.chars.each_cons(2) do |chars|
    rule_1 = true and break if line.sub(chars.join, '  ').match?(chars.join)
  end

  line.chars.each_cons(3) do |a, b, c|
    rule_2 = true and break if a == c
  end

  nice += 1 if rule_1 && rule_2
end

puts nice

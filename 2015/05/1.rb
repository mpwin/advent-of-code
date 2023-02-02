nice = 0

File.open('input.txt').each do |line|
  rule_1 = line.count('aeiou') >= 3
  rule_2 = line.chars.each_cons(2).any? { |a, b| a == b }
  rule_3 = line.chars.each_cons(2).all? { |chars| !chars.join.match?(/ab|cd|pq|xy/) }

  nice += 1 if rule_1 && rule_2 && rule_3
end

puts nice

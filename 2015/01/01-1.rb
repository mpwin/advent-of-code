# Ruby 3.0

floor = 0

File.open('input.txt').each_char do |char|
  case char
  when '(' then floor += 1
  when ')' then floor -= 1
  end
end

puts floor

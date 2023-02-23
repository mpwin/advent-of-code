floor = 0

File.open('input.txt').each_char.with_index do |char, index|
  case char
  when '(' then floor += 1
  when ')' then floor -= 1
  end

  if floor < 0
    puts index + 1
    break
  end
end

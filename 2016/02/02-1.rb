code = []
key  = 5

File.open('input.txt').each do |line|
  line.each_char do |char|
    case char
    when 'U' then key -= 3 unless [1, 2, 3].include? key
    when 'D' then key += 3 unless [7, 8, 9].include? key
    when 'L' then key -= 1 unless [1, 4, 7].include? key
    when 'R' then key += 1 unless [3, 6, 9].include? key
    end
  end

  code << key
end

puts code.join

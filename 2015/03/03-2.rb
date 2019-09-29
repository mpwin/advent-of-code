require 'set'

santas = [0i, 0i]
houses = Set[*santas]
moves  = { '^' => 1i, 'v' => -1i, '<' => -1, '>' => 1 }

File.open('input.txt').each_char.with_index do |char, index|
  santas[index % 2] += moves[char]
  houses            << santas[index % 2]
end

puts houses.size

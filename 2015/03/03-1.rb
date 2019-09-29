require 'set'

santa  = 0i
houses = Set[santa]
moves  = { '^' => 1i, 'v' => -1i, '<' => -1, '>' => 1 }

File.open('input.txt').each_char do |char|
  santa  += moves[char]
  houses << santa
end

puts houses.size

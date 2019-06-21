input  = File.open('input.txt').read.chomp
length = input.length

Array('a'..'z').each do |char|
  polymer = input.delete(char + char.upcase)
  index   = 0

  while index < polymer.length - 1 do
    if polymer[index] == polymer[index + 1].swapcase
      polymer.slice!(index..index + 1)
      index -= 1 unless index.zero?
    else
      index += 1
    end
  end

  length = polymer.length if polymer.length < length
end

puts length

input = File.open('input.txt').read.split.map(&:to_i)
index = 0
steps = 0

while index.between?(0, input.size - 1) do
  i         = index
  index    += input[i]
  input[i] += 1
  steps    += 1
end

puts "Answer 1: #{steps}"

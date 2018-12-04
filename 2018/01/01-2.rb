input = File.open('input.txt').read.split.map(&:to_i)
list  = []
freq  = 0

input.cycle do |f|
  list << freq
  freq += f

  break if list.include? freq
end

puts freq

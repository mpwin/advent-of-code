require 'set'

input = File.open('input.txt').each_line.map(&:to_i)
set   = Set.new
freq  = 0

input.cycle do |i|
  set  << freq
  freq += i

  break if set.include? freq
end

puts freq

require 'set'

group = Set.new
count = 0

(File.readlines('input.txt') << "\n").each do |line|
  if line == "\n"
    count += group.size
    group.clear
  else
    group += line.chomp.chars
  end
end

puts count

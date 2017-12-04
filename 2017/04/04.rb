input    = File.open('input.txt').read
answer_1 = 0
answer_2 = 0

input.each_line do |line|
  words    = line.split
  anagrams = words.map(&:chars).map(&:sort).map(&:join)

  answer_1 += 1 if words.size == words.uniq.size
  answer_2 += 1 if words.size == anagrams.uniq.size
end

puts "Answer 1: #{answer_1}"
puts "Answer 2: #{answer_2}"

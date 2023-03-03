chars = 0

File.open('input.txt').each do |line|
  line.chomp!
  len = line.length
  line.gsub!(/^"|"$/, '.' * 3)
  line.gsub!(/\\\\|\\"/, '.' * 4)
  line.gsub!(/\\x../, '.' * 5)
  chars += line.length - len
end

puts chars

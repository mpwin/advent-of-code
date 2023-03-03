chars = 0

File.open('input.txt').each do |line|
  line.chomp!
  len = line.length
  line.gsub!(/^"|"$/, '')
  line.gsub!(/\\\\|\\"|\\x../, '.')
  chars += len - line.length
end

puts chars

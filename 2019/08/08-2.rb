image = Array.new(25 * 6)

File.open('input.txt').each_char.with_index do |char, index|
  image[index % (25 * 6)] ||= char unless char == '2'
end

for row in 0..5 do
  chars = image[(row * 25)..((row * 25) + 24)]
  puts chars.join.gsub(/[01]/, '0' => ' ', '1' => '@')
end

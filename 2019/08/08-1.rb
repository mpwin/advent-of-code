layers = Hash.new { |hash, key| hash[key] = { '0' => 0, '1' => 0, '2' => 0 }}

File.open('input.txt').each_char.with_index do |char, index|
  layers[index / (25 * 6)][char] += 1
end

min = layers.values.min_by { |v| v['0'] }

puts min['1'] * min['2']

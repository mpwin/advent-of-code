input = File.open('input.txt').read

list      = Array(0..255)
position  = 0
skip_size = 0
lengths   = input.bytes.push(17, 31, 73, 47, 23)

64.times do
  lengths.each do |length|

    list.rotate(position).take(length).reverse.each do |i|
      list[position] = i
      position       = (position == list.size - 1 ? 0 : position + 1)
    end

    position  += skip_size
    position  -= list.size * (position / list.size)
    skip_size += 1

  end
end

dense_hash  = list.each_slice(16).map { |i| i.inject(:^) }
hexadecimal = dense_hash.map { |i| i.to_s(16).rjust(2, '0') }.join

puts "Answer 2: #{hexadecimal}"

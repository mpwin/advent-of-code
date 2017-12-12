input = File.open('input.txt').read

list      = Array(0..255)
position  = 0
skip_size = 0
lengths   = input.split(',').map(&:to_i)

lengths.each do |length|
  next if length > list.size

  list.rotate(position).take(length).reverse.each do |i|
    list[position] = i
    position       = (position == list.size - 1 ? 0 : position + 1)
  end

  position  += skip_size
  position  -= list.size * (position / list.size)
  skip_size += 1
end

puts 'Answer 1: %s' % (list[0] * list[1])

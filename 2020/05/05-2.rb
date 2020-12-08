require 'set'

seats = Set.new
high  = (`ruby 05-1.rb`).to_i
low   = high

def search(range, input)
  while input.any?
    mid   = range.to_a[range.size / 2]
    range = case input.shift
    when 'F', 'L' then range.first..mid-1
    when 'B', 'R' then mid..range.last
    end
  end

  return range.first
end

File.foreach('input.txt') do |line|
  r, c = line.match(/^([F|B]{7})([L|R]{3})$/).captures
  row  = search(0..127, r.chars)
  col  = search(0..7,   c.chars)
  seat = (row * 8) + col

  seats << seat
  low    = seat if seat < low
end

puts (Set.new(low..high) - seats).first

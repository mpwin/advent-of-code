class Layer
  attr_reader :range, :position

  def initialize(range)
    @range     = range
    @position  = 0
    @ascending = true
  end

  def scan
    @position  += (@ascending ? 1 : -1)
    @ascending  = !@ascending if @position == 0 || @position == @range - 1
  end
end

input       = File.open('input.txt').read
layers      = Hash.new
packets     = Hash.new
picoseconds = 0
max_depth   = 0

input.each_line do |line|
  match = line.match(/(\d+): (\d+)/)
  depth = match[1].to_i
  range = match[2].to_i

  layers[depth] = Layer.new(range)
  max_depth     = depth if depth > max_depth
end

loop do
  packets[picoseconds] = 0

  print "Picoseconds: #{picoseconds} - "
  puts  "Packets: #{packets}"

  break if packets.values.max > max_depth

  packets.each do |picoseconds, depth|
    if layer = layers[depth] and layer.position == 0
      packets.delete(picoseconds)
    else
      packets[picoseconds] += 1
    end
  end

  layers.values.each(&:scan)
  picoseconds += 1
end

puts 'Answer 2: %s' % packets.key(packets.values.max)

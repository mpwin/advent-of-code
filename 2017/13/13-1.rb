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

input     = File.open('input.txt').read
layers    = Hash.new
max_depth = 0
severity  = 0

input.each_line do |line|
  match = line.match(/(\d+): (\d+)/)
  depth = match[1].to_i
  range = match[2].to_i

  layers[depth] = Layer.new(range)
  max_depth     = depth if depth > max_depth
end

for depth in 0..max_depth do
  if layer = layers[depth] and layer.position == 0
    severity += depth * layer.range
  end

  layers.values.each(&:scan)
end

puts "Answer 1: #{severity}"

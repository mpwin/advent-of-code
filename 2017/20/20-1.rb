Particle = Struct.new(:id, :p, :v, :a) do
  def p_sum; p.map(&:abs).sum; end
  def a_sum; a.map(&:abs).sum; end
end

input     = File.open('input.txt').read
particles = []

input.lines.each_with_index do |line, index|
  match   = line.match(/p=<(.+)>, v=<(.+)>, a=<(.+)>/)
  p, v, a = match[1..3].map { |m| m.split(',').map(&:to_i) }

  particles << Particle.new(index, p, v, a)
end

min_a = particles.min_by { |p| p.a_sum }.a_sum
particles.keep_if { |p| p.a_sum == min_a }
particle = particles.min_by { |p| p.p_sum }

puts "Answer 1: #{particle.id}"

input     = File.open('input.txt').read
Particle  = Struct.new(:id, :p, :v, :a)
particles = []

input.lines.each_with_index do |line, index|
  match   = line.match(/p=<(.+)>, v=<(.+)>, a=<(.+)>/)
  p, v, a = match[1..3].map { |m| m.split(',').map(&:to_i) }

  particles << Particle.new(index, p, v, a)
end

1000.times do
  positions  = []
  duplicates = []

  particles.each do |particle|
    particle.v = particle.v.zip(particle.a).map(&:sum)
    particle.p = particle.p.zip(particle.v).map(&:sum)

    if positions.include? particle.p.to_s
      duplicates << particle.p.to_s
    else
      positions  << particle.p.to_s
    end
  end

  particles.delete_if { |p| duplicates.include? p.p.to_s }
end

puts "Answer 2: #{particles.size}"

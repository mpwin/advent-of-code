input    = File.open('input.txt').read
graph    = Hash.new
programs = Array.new
groups   = Array.new

input.each_line do |line|
  match  = line.match(/(\d+) <-> (.+)/)
  vertex = match[1]
  edges  = match[2].split(', ')

  graph[vertex]  = edges
  programs      << vertex
end

while !programs.empty? do
  vertices = Array.new
  queue    = Queue.new.push(programs.first)

  while !queue.empty? do
    vertex    = queue.pop
    vertices << vertex

    graph[vertex].each do |edge|
      queue.push(edge) if !vertices.include? edge
    end
  end

  groups   << vertices
  programs -= vertices
end

puts "Answer 1: #{groups.first.size}"
puts "Answer 2: #{groups.size}"

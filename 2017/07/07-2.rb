Struct.new('Program', :weight, :disc)

def get_weight(name, tower)
  program = tower[name]

  if program.disc
    weights = program.disc.map { |name| get_weight(name, tower) }

    if weights.uniq.size != 1
      unique     = weights.sort_by { |i| weights.grep(i).length }.first
      difference = unique - (weights.uniq - [unique]).first
      weight     = tower[ program.disc[weights.index(unique)] ].weight

      puts "Answer 2: #{weight - difference}"
      exit
    end

    return program.weight + weights.sum
  else
    return program.weight
  end
end

input = File.open('input.txt').read
tower = {}
root  = 'cyrupz' # Answer from part one.

input.each_line do |line|
  data   = line.match(/(\S+)\s\((\d+)\)(\s->\s(\D+))?/)
  name   = data[1]
  weight = data[2].to_i
  disc   = data[4] ? data[4].chomp.split(', ') : nil

  tower[name] = Struct::Program.new(weight, disc)
end

get_weight(root, tower)

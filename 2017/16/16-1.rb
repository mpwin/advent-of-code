programs = Array('a'..'p')
moves    = File.open('input.txt').read.split(',')

moves.each do |move|
  case move.slice!(0)
  when 's'
    programs.rotate!(-move.to_i)
  when 'x'
    i, j = move.split('/').map(&:to_i)
    programs[i], programs[j] = programs[j], programs[i]
  when 'p'
    a, b = move.split('/')
    i, j = programs.index(a), programs.index(b)
    programs[i], programs[j] = programs[j], programs[i]
  end
end

puts "Answer 1: #{programs.join}"

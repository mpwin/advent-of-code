input   = File.open('input.txt').read.each_line
program = input.first[/\S+/]

loop do
  line = input.next

  if line[/->/]
    data = line.match(/(\S+).+->\s(\D+)/)
    name = data[1]
    disc = data[2].chomp.split(', ')

    if disc.include? program
      program = name
      input.rewind
    end
  end
end

puts "Answer 1: #{program}"

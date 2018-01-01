class Program
  attr_accessor :registers, :queue, :index, :state

  def initialize(id)
    @registers = Hash.new(0)
    @queue     = Queue.new
    @index     = 0
    @state     = :running

    @registers['p'] = id
  end
end

instructions = File.open('input.txt').read.lines.map(&:chomp)
programs     = [ Program.new(0), Program.new(1) ]
send_counter = 0

while programs.map(&:state).uniq != [:waiting] do
  programs.each do |program|
    next if program.state == :waiting && program.queue.empty?

    i, x, y = instructions[program.index].match(/(...) (.) ?(.*)/)[1..3]
    y       = (y =~ /\d+/ ? y.to_i : program.registers[y])

    case i
    when 'add' then program.registers[x] += y
    when 'mul' then program.registers[x] *= y
    when 'mod' then program.registers[x] %= y
    when 'set' then program.registers[x]  = y

    when 'snd'
      programs[programs.index(program) ^ 1].queue.push(program.registers[x])
      send_counter += 1 if programs.index(program) == 1

    when 'rcv'
      if program.queue.empty?
        program.state = :waiting
        next
      else
        program.registers[x] = program.queue.pop
        program.state = :running
      end

    when 'jgz'
      if (x =~ /\d+/ ? x.to_i : program.registers[x]) > 0
        program.index += y
        next
      end
    end

    program.index += 1
  end
end

puts "Answer 2: #{send_counter}"

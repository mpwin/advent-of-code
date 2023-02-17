@circuit = {}
@wires = { 'b' => 46065 }

File.open('input.txt').each do |line|
  instruction, wire = line.match(/(.+) -> (\w+)/).captures
  @circuit[wire] = instruction
end

def get(wire)
  return @wires[wire] if @wires.has_key?(wire)
  return wire.to_i if wire.match(/\d+/)

  @wires[wire] = case @circuit[wire]
  when /(.+) AND (.+)/ then get($1) & get($2)
  when /(.+) OR (.+)/ then get($1) | get($2)
  when /(.+) LSHIFT (\d+)/ then get($1) << $2.to_i
  when /(.+) RSHIFT (\d+)/ then get($1) >> $2.to_i
  when /NOT (.+)/ then 65535 - get($+)
  when /\w+/ then get($&)
  when /\d+/ then $&.to_i
  end
end

puts get('a')

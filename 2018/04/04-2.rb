require 'time'

records = []

File.open('input.txt').each_line do |line|
  date, entry = line[1..16], line[19..-1].chomp
  time        = Time.strptime(date, '%Y-%m-%d %H:%M')
  records    << [time, entry]
end

records = records.sort.to_enum
guards  = Hash.new { |hash, key| hash[key] = Array.new(60, 0) }
guard   = nil
asleep  = false

loop do
  time, entry = records.next

  case entry
  when /begins shift/ then guard  = entry[/\d+/]
  when /falls asleep/ then asleep = true
  when /wakes up/     then asleep = false
  end

  while time.hour != 1 && time != records.peek.first do
    guards[guard][time.min] += 1 if asleep
    time += 60
  end
end

id, minutes = guards.max_by { |_, minutes| minutes.max }
minute      = minutes.index(minutes.max)

puts id.to_i * minute

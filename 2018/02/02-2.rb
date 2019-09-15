input = File.readlines('input.txt', chomp: true)

loop do
  id = input.shift

  input.each do |line|
    match = line.chars.select.with_index do |char, index|
      char == id[index]
    end

    if match.size == line.length - 1
      puts match.join
      return
    end
  end
end

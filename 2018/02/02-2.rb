input = File.readlines('input.txt', chomp: true)

loop do
  id = input.shift

  input.each do |line|
    common = line.chars.select.with_index do |char, index|
      char == id[index]
    end

    if common.size == line.size - 1
      puts common.join
      return
    end
  end
end

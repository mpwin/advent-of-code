distances = Hash.new { |hash, key| hash[key] = {} }
answer = Float::INFINITY

File.open('input.txt').each do |line|
  start, finish, distance = line.match(/(\w+) to (\w+) = (\d+)/).captures
  distances[start][finish] = distance.to_i
  distances[finish][start] = distance.to_i
end

distances.keys.permutation.each do |permutation|
  distance = 0
  valid = true

  permutation.zip(permutation.rotate)[..-2].each do |start, finish|
    if distances[start].has_key?(finish)
      distance += distances[start][finish]
    else
      valid = false
      break
    end
  end

  answer = distance if distance < answer && valid
end

puts answer

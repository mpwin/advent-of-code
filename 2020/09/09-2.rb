target = `ruby 09-1.rb`.to_i
list   = []

File.foreach('input.txt') do |line|
  list.append line.to_i
  list.shift  while list.sum > target

  if list.sum == target
    puts list.minmax.sum
    return
  end
end

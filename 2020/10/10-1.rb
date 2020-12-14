require 'set'

input  = File.readlines('input.txt').map(&:to_i).to_set
jolts  = 0
n1, n3 = 0, 0

loop do
  if input.include?(jolts + 1)
    jolts += 1
    n1    += 1
    next
  end

  if input.include?(jolts + 2)
    jolts += 2
    next
  end

  if input.include?(jolts + 3)
    jolts += 3
    n3    += 1
    next
  end

  break
end

puts n1 * (n3 + 1)

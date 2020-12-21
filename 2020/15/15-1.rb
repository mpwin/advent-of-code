input = File.read('input.txt').split(',').map(&:to_i)
nums  = input.map.with_index { |num, index| [num, [index + 1]] }.to_h
last  = input.last
turn  = nums.size

nums.default = []

(2020 - nums.size).times do
  last  = (nums[last].size == 2 ? nums[last][1] - nums[last][0] : 0)
  turn += 1

  nums[last] = [nums[last].last, turn].compact
end

puts last

require 'set'

@input = File.readlines('input.txt').map(&:to_i).to_set
@memo  = {}

def count(jolts)
  return @memo[jolts] if @memo[jolts]

  sum  = 0
  sum += count(jolts + 1) if @input.include?(jolts + 1)
  sum += count(jolts + 2) if @input.include?(jolts + 2)
  sum += count(jolts + 3) if @input.include?(jolts + 3)

  @memo[jolts] = sum.nonzero? || 1
end

puts count(0)

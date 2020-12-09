require 'set'

rules = Hash.new { |k, v| k[v] = Array.new }
bags  = Set.new

File.foreach('input.txt') do |line|
  bag, *contains = line.scan(/(\w+ \w+) bag/).flatten

  contains.each do |cont|
    rules[cont] << bag
  end
end

def count(set, bags, rules)
  bags.each do |bag|
    set.merge(count(set, rules[bag], rules))
  end

  return set += bags
end

puts count(bags, rules['shiny gold'], rules).size

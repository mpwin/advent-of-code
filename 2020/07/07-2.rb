rules = {}

File.foreach('input.txt') do |line|
  bag        = line.match(/(\w+ \w+)/).captures.first
  contains   = line.scan(/(\d) (\w+ \w+)/).map(&:reverse)
  rules[bag] = contains.to_h
end

def count(bags, rules)
  1 + bags.sum do |bag, quantity|
    quantity.to_i * count(rules[bag], rules)
  end
end

puts count(rules['shiny gold'], rules) - 1

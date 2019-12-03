def get_fuel(mass)
  fuel = (mass / 3) - 2
  fuel <= 0 ? 0 : fuel + get_fuel(fuel)
end

puts File.open('input.txt').sum { |mass| get_fuel(mass.to_i) }

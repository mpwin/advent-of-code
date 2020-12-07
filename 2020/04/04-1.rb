fields   = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
passport = []
valid    = 0

(File.readlines('input.txt') << "\n").each do |line|
  if line == "\n"
    valid += 1 if (passport & fields).size == fields.size      
    passport.clear
  else
    passport += line.scan(/([a-z]{3}):/).flatten
  end
end

puts valid

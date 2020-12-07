passport = {}
valid    = 0

(File.readlines('input.txt') << "\n").each do |line|
  if line == "\n"
    fields = []

    passport.each do |field, value|
      fields << case field
      when 'byr' then value.to_i.between?(1920, 2002)
      when 'iyr' then value.to_i.between?(2010, 2020)
      when 'eyr' then value.to_i.between?(2020, 2030)
      when 'hgt'
        height, units = value.scan(/^(\d+)(cm|in)$/).flatten
        case units
        when 'cm' then height.to_i.between?(150, 193)
        when 'in' then height.to_i.between?( 59,  76)
        end
      when 'hcl' then value.match?(/^\#[0-9a-f]{6}$/)
      when 'ecl' then value.match?(/^amb|blu|brn|gry|grn|hzl|oth$/)
      when 'pid' then value.match?(/^[0-9]{9}$/)
      end
    end

    fields.compact!
    valid += 1 if fields.size == 7 && fields.all?
    passport.clear
  else
    line.scan(/([a-z]{3}):(\S+)/).each do |field, value|
      passport[field] = value
    end
  end
end

puts valid

look = '1113222113'

50.times do
  look.gsub!(/(1+|2+|3+)/) do |match|
    [match.length, match[0]].join 
  end
end

puts look.length

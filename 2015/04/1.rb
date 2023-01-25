require 'digest'

input = 'yzbqklnj'
count = 0

loop do
    hash = Digest::MD5.hexdigest("#{input}#{count}")
    break if hash[0..4] == '00000'
    count += 1
end

puts count

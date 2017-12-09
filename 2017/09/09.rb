input   = File.open('input.txt').read
score   = 0
garbage = 0

depth      = 0
in_garbage = false
canceled   = false

input.chars.each do |char|
  if char == '!' || canceled
    canceled = !canceled
    next
  end

  if !in_garbage
    case char
    when '{' then depth += 1 and score += depth
    when '}' then depth -= 1
    when '<' then in_garbage = true
    end
  else
    if char == '>'
      in_garbage = false
    else
      garbage += 1
    end
  end
end

puts "Answer 1: #{score}"
puts "Answer 2: #{garbage}"

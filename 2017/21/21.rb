def enhance(image, rules, depth, current = 0)
  if depth == current
    return image.count('#')
  end

  size = Math.sqrt(image.size)

  i = if size == 3
    rules[image]
  else
    squares = Hash.new('')
    across  = size / 2
    index   = 0
    img     = ''

    for i in 0..across - 1 do
      2.times do
        for j in 0..across - 1 do
          squares[(i * across) + j] += image[index..index + 1]
          index += 2
        end
      end
    end

    squares.each do |k, v|
      squares[k] = rules[v].dup
    end

    for i in 0..across - 1 do
      3.times do
        for j in 0..across - 1 do
          img += squares[(i * across) + j].slice!(0..2)
        end
      end
    end

    img
  end

  if Math.sqrt(i.size) == 9
    return [
      enhance((i[ 0.. 2] + i[ 9..11] + i[18..20]), rules, depth, current + 1),
      enhance((i[ 3.. 5] + i[12..14] + i[21..23]), rules, depth, current + 1),
      enhance((i[ 6.. 8] + i[15..17] + i[24..26]), rules, depth, current + 1),
      enhance((i[27..29] + i[36..38] + i[45..47]), rules, depth, current + 1),
      enhance((i[30..32] + i[39..41] + i[48..50]), rules, depth, current + 1),
      enhance((i[33..35] + i[42..44] + i[51..53]), rules, depth, current + 1),
      enhance((i[54..56] + i[63..65] + i[72..74]), rules, depth, current + 1),
      enhance((i[57..59] + i[66..68] + i[75..77]), rules, depth, current + 1),
      enhance((i[60..62] + i[69..71] + i[78..80]), rules, depth, current + 1)
    ].sum
  else
    return enhance(i, rules, depth, current + 1)
  end
end

def flip(p)
  if p.size == 4
    p[0], p[1], p[2], p[3] =
    p[1], p[0], p[3], p[2]
  else
    p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8] =
    p[2], p[1], p[0], p[5], p[4], p[3], p[8], p[7], p[6]
  end
end

def rotate(p)
  if p.size == 4
    p[0], p[1], p[2], p[3] =
    p[2], p[0], p[3], p[1]
  else
    p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8] =
    p[6], p[3], p[0], p[7], p[4], p[1], p[8], p[5], p[2]
  end
end

input = File.open('input.txt')
image = '.#...####'
rules = {}

input.read.each_line do |line|
  i, o = line.delete('/').match(/^(.+) => (.+)$/)[1..2]

  2.times do
    4.times do
      rules[i] = o
      rotate(i)
    end
    flip(i)
  end
end

puts 'Answer 1: %s' % enhance(image, rules,  5)
puts 'Answer 2: %s' % enhance(image, rules, 18)

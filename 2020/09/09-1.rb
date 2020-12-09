input = File.new('input.txt')
list  = []

25.times { list << input.gets.to_i }

while line = input.gets do
  int   = line.to_i
  valid = false

  catch(:valid) do
    for i in 0..list.size-1 do
      for j in i+1..list.size-1 do
        if int == list[i] + list[j]
          valid = true
          throw(:valid)
        end
      end
    end
  end

  if !valid
    input.close
    puts int
    return
  end

  list.append int
  list.shift
end

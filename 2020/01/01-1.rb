input = File.open('input.txt').map(&:to_i)

for i in 0..input.size-1 do
  for j in i+1..input.size-1 do
    if input[i] + input[j] == 2020
      puts input[i] * input[j]
      return
    end
  end
end

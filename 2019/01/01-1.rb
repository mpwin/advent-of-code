puts File.open('input.txt').sum { |mass| (mass.to_i / 3) - 2 }

input = 265149
rings = [[1, 2, 4, 5, 10, 11, 23, 25]]
cells = rings.last.size
value = rings.last.last

while value < input do
  if cells == rings.last.size
    cells += 8
    rings << [nil]
  else
    rings.last << nil
  end

  current_cell = rings.last.size
  cell_proximity_to_corner = current_cell % (cells / 4)
  cell_placement =
    if cell_proximity_to_corner == 0
      :corner
    elsif (cell_proximity_to_corner + 1) % (cells / 4) == 0
      :before_corner
    elsif cell_proximity_to_corner - 1 == 0
      :after_corner
    else
      :side
    end

  case cell_placement
  when :corner
    corner = current_cell / (cells / 4)
    inner  = (((cells - 8) / 4) * corner) - 1
    value += rings[-2][inner]
    value += rings[-1][0] if current_cell - 1 == cells - 1
  when :before_corner
    side   = current_cell / (cells / 4)
    index  = current_cell - 1
    inner  = index - 1 - (2 * side)
    value += rings[-2][inner]
    value += rings[-2][inner - 1]
    value += rings[-1][0] if index + 1 == cells - 1
  when :after_corner
    side   = current_cell / (cells / 4)
    index  = current_cell - 1
    inner  = index - (2 * side)
    value += rings[-2][inner]
    value += rings[-2][inner - 1] unless inner - 1 < 0
    value += rings[-1][index - 2] unless index - 2 < 0
  when :side
    side   = current_cell / (cells / 4)
    index  = current_cell - 1
    inner  = index - (2 * side)
    value += rings[-2][inner]
    value += rings[-2][inner - 1]
    value += rings[-2][inner - 2] unless inner - 2 < 0
    value += rings[-2][-1]        if     index == 1
  end

  rings[-1][-1] = value
end

puts "Answer 2: #{value}"

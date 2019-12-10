module IntcodeComputer
  def self.run(program, noun, verb)
    m       = program.dup
    m[1..2] = noun, verb
    i       = 0

    loop do
      case m[i]
      when  1 then m[m[i+3]] = m[m[i+1]] + m[m[i+2]]
      when  2 then m[m[i+3]] = m[m[i+1]] * m[m[i+2]]
      when 99 then break
      end

      i += 4
    end

    return m.first
  end
end

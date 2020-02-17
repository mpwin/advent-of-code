module IntcodeComputer
  def self.run(program)
    @m = program
    @i = 0
    @r = 0

    loop do
      case @m[@i] % 100
      when 1
        @m[@m[@i+3] + r(3)] = p(1) + p(2)
        @i += 4
      when 2
        @m[@m[@i+3] + r(3)] = p(1) * p(2)
        @i += 4
      when 3
        @m[@m[@i+1] + r(1)] = gets.chomp.to_i
        @i += 2
      when 4
        puts p(1)
        @i += 2
      when 5
        @i = (p(1) != 0 ? p(2) : @i+3)
      when 6
        @i = (p(1) == 0 ? p(2) : @i+3)
      when 7
        @m[@m[@i+3] + r(3)] = (p(1) <  p(2) ? 1 : 0)
        @i += 4
      when 8
        @m[@m[@i+3] + r(3)] = (p(1) == p(2) ? 1 : 0)
        @i += 4
      when 9
        @r += p(1)
        @i += 2
      when 99 then break
      end
    end
  end

  def self.p(param)
    case @m[@i].digits[param+1]
    when 0, nil then @m[@m[@i+param]]
    when 1      then @m[@i+param]
    when 2      then @m[@m[@i+param] + @r]
    end
  end

  def self.r(param)
    @m[@i].digits[param+1] == 2 ? @r : 0
  end
end

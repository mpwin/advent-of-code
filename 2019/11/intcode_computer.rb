class IntcodeComputer
  def initialize(program)
    @m = Hash.new(0)
    @i = 0
    @r = 0

    program.split(',').each.with_index do |code, index|
      @m[index] = code.to_i
    end
  end

  def run
    loop do
      case @m[@i] % 100
      when 1
        @m[@m[@i+3] + r(3)] = p(1) + p(2)
        @i += 4
      when 2
        @m[@m[@i+3] + r(3)] = p(1) * p(2)
        @i += 4
      when 3
        return @check_halt = false if @check_halt
        @m[@m[@i+1] + r(1)] = @input
        @i += 2
      when 4
        return @check_halt = false if @check_halt
        output = p(1)
        @i += 2
        return output
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
      when 99
        return true if @check_halt
        break
      end
    end
  end

  def input(input)
    @input = input
  end

  def halt?
    @check_halt = true
    run
  end

  private

  def p(param)
    case @m[@i].digits[param+1]
    when 0, nil then @m[@m[@i+param]]
    when 1      then @m[@i+param]
    when 2      then @m[@m[@i+param] + @r]
    end
  end

  def r(param)
    @m[@i].digits[param+1] == 2 ? @r : 0
  end
end

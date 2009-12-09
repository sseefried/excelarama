class BinOp
  attr_reader :op

  def initialize(op)
    @op = op
  end

end


class Cell
  attr_reader :row
  attr_reader :col

  def initialize(row, col)
    @row = row
    @col = col
  end
end

class Const
  attr_reader :value
  def initialize(value)
    @value = value.to_f
  end

end

def lex(str)
  def lex_(str)
    if str.size == 0 
      puts "end"
      return []
    else
      if  str =~ /(^[\+*-\/])(.*)/ 
        token = BinOp.new($1)
        rest  = $2
      elsif str =~ /^\$?([A-Za-z]+)\$?([1-9][0-9]*)(.*)/
        token = Cell.new($1, $2)
        rest  = $3
      elsif str =~ /^([1-9][0-9]*)(.*)/
      token = Const.new($1)
        rest  = $2
      else
        raise "lex failed"
      end
      
      tokens = lex(rest)
      return [token] + tokens
      
    end
  end
  lex_(str.split.join)
end

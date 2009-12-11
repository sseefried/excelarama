include Lexer

# <Exp>    ::= <Term> <Exp'> 
# <Exp'>   ::= + <Exp> | - <Exp> | e
# <Term>   ::= <Factor> <Term'>
# <Term'>  ::= * <Term> | / <Term> | e
# <Factor> ::= ( <Exp> ) | Cell | Const

#
# Some things I re-learned about recursive decent parsers. The grammar must be LL(1).
# This means either:
#   a) The production begins with a non-terminal and  
#   b) The production consists of a number of alternatives all of which begin with a 
#       distinct terminal symbol.

class Cell
  attr_reader :row, :col
  
  def initialize(col , row)
    @col = col
    @row = row
  end
end

class Const
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

# Abstract class
class BinOp
  attr_reader :lhs, :rhs

  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

end

class Add < BinOp; end
class Mul < BinOp; end
class Div < BinOp; end
class Sub < BinOp; end


class Parser 

  def initialize(tokens)
    @errors = []
    @tokens = tokens
  end

  def parse
    e = expr
    if @errors.size > 0 
      puts @errors
    else
      return e
    end
  end

  def expr

    e1 = term 
    if (r = expr1)
      return r[:op].new(e1,r[:expr])
    else
      return e1
    end
  end

  # Returns nil if "empty" is accepted
  def expr1
    if accept(PlusToken)
      return { :op => Add, :expr => expr }
    elsif accept(MinusToken)
      return { :op => Sub, :expr => expr } 
    else
      return nil
    end
  end


  def term
    e1 = factor
    if (r = term1)
      return r[:op].new(e1,r[:expr])
    else
      return e1
    end
  end

  # Returns nil if "empty" is accepted
  def term1
    if accept(StarToken)
      return {:op => Mul, :expr => term }
    elsif accept(SlashToken)
      return {:op => Div, :expr => term }
    else
      return nil
    end
  end


  def factor
    if (cell = accept(CellToken))
      cell.string =~ /^\$?([A-Za-z])+\$?([1-9][0-9]*)/
      return Cell.new(Excelx.letter_to_number($1), $2.to_i)
    elsif (const = accept(ConstToken))
      const.string =~ /([1-9][0-9]*(\.[0-9]*))/
      return Const.new($1.to_f)
    else
      raise "Parse error: Expecting Cell or Const. #{tokens = @tokens.inspect}"
    end
  end

  private

  def accept(cls)
    if @tokens.first.is_a?(cls)
      r = @tokens.shift
      return r
    else
      return nil
    end
  end

  def expect(cls)
    if accept(cls)
      return true
    else
      @errors.push("Unexpected token: #{token.inspect}")
      return false
    end
  end

  def no_more_tokens?
    return @tokens.empty?
  end



end

module Lexer
  class Token
    attr_accessor :string
    def initialize(string)
      @string = string
    end
    
    def ==(other)
      self.string == other.string
    end

  end
  
  class PlusToken < Token; end
  class MinusToken < Token; end
  class StarToken < Token; end
  class SlashToken < Token; end
  class CellToken  < Token; end
  class ConstToken < Token; end
  
  
  def lex(str)
    def lex_(str)
      if str.size == 0 
        puts "end"
        return []
      else
        if  str =~ /^(\+)(.*)/ 
          cls = PlusToken
          rest = $2
        elsif  str =~ /^(\*)(.*)/ 
          cls = StarToken
          rest = $2
        elsif  str =~ /^(-)(.*)/ 
          cls = MinusToken
          rest = $2
        elsif str =~ /^(\/)(.*)/ 
          cls = SlashToken
          rest = $2
        elsif str =~ /^(\$?[A-Za-z]+\$?[1-9][0-9]*)(.*)/
          cls = CellToken
          rest = $2
        elsif str =~ /^([1-9][0-9]*(\.[0-9]*)?)(.*)/
          cls = ConstToken
          rest = $3
        else
          raise "Lexing failed on `#{str}'"
        end
        
        token = cls.new($1)

        
        tokens = lex(rest)
        return [token] + tokens
      end
    end
    lex_(str.split.join)
  end
end

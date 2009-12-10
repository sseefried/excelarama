require 'parser'



def evaluate(node)
  case node
  when Add
    evaluate(node.lhs) + evaluate(node.rhs)
  when Sub
    evaluate(node.lhs) - evaluate(node.rhs)
  when Mul
    evaluate(node.lhs) * evaluate(node.rhs)
  when Div
    evaluate(node.lhs) / evaluate(node.rhs)
  when Const
    return node.value
  when Cell
    raise "Can't evaluate cells yet"
  else
    raise "Unknown node class #{node.class}"
  end
end


# require 'eval'; p = Parser.new(lex("1+2")); evaluate(p.parse)

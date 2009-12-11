class ExcelFile < ActiveRecord::Base
  validates_uniqueness_of :path
  validates_presence_of :path
  validates_presence_of :first_column
  validates_presence_of :first_row
  validates_presence_of :last_column
  validates_presence_of :last_row

  has_many :excel_cells
  
  include Lexer

  def cell_at(col, row)
    ExcelCell.find_cell(id, col, row)
  end

  def evaluate_cell(col,row)
    if cell = cell_at(col,row)
      begin
        tokens = lex(cell.contents)
        p = Parser.new(tokens)
        node = p.parse
        return eval_node(node)
      rescue
        return "&lt;Could not evaluate&gt;"
      end
    else
      return nil
    end
  end
  
   private

   def eval_node(node)
     case node
     when Add
      eval_node(node.lhs) + eval_node(node.rhs)
     when Sub
       eval_node(node.lhs) - eval_node(node.rhs)
     when Mul
       eval_node(node.lhs) * eval_node(node.rhs)
     when Div
      eval_node(node.lhs) / eval_node(node.rhs)
     when Const
       return node.value
     when Cell
       evaluate_cell(node.col, node.row)
     else
       raise "Unknown node class #{node.class}"
     end
   end
  
end

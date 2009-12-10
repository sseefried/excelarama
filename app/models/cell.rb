class Cell < ActiveRecord::Base

  validates_presence_of :contents, :row, :column
  validates_numericality_of :row

  def self.find_cell(col, row)
    Cell.find(:first, :conditions => ['column = ? and row = ?', col, row])
  end

end

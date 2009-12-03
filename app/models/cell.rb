class Cell < ActiveRecord::Base

  validates_presence_of :contents, :row, :column 
  validates_numericality_of :row

end

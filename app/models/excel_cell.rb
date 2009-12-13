class ExcelCell < ActiveRecord::Base

  belongs_to :excel_file
  validates_presence_of :contents, :row, :col, :excel_file_id
  validates_numericality_of :row

  def self.find_cell(id, col, row)
    self.find_by_excel_file_id(id, :conditions => ['col = ? and row = ?', col, row])
  end

end

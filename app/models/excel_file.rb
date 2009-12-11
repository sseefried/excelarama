class ExcelFile < ActiveRecord::Base
  validates_presence_of :path
  validates_presence_of :first_column
  validates_presence_of :first_row
  validates_presence_of :last_column
  validates_presence_of :last_row

end

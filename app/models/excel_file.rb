class ExcelFile < ActiveRecord::Base
  validates_presence_of :path
  
end

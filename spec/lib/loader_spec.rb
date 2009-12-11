require 'spec_helper'

EXCEL_FILE_PATH =  "#{RAILS_ROOT}/spec/data/Simple.xlsx"

describe Loader do
  before(:each) do 

    @loader = Loader.new(EXCEL_FILE_PATH)
  end

  describe "being created" do
    it "should be created given a path" do
      @loader.should_not be_nil
    end
  end

  describe "loading an excel file" do
    it "should add the cells to the database" do
      @loader.load

      f = ExcelFile.find_by_path(EXCEL_FILE_PATH)
      f.should_not be_nil

      size =  Cell.find_all_by_excel_file_id(f.id).size
      size.should_not == 0
      
      b1 = Cell.find_cell(2, 1)
      b1.should_not be_nil
      b1.contents.should == "1.0"

      b2 = Cell.find_cell(2, 2) 
      b2.should_not be_nil
      b2.contents.should == "2.0"
      
      a2 = Cell.find_cell(1, 2)
      a2.should_not be_nil
      a2.contents.should == "SUM(B1:B10)"

    end
  end



end

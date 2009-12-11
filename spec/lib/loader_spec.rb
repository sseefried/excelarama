require 'spec_helper'

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

      size =  ExcelCell.find_all_by_excel_file_id(f.id).size
      size.should_not == 0
      
      b1 = ExcelCell.find_cell(f.id, 2, 1)
      b1.should_not be_nil
      b1.contents.should == "1.0"

      b2 = ExcelCell.find_cell(f.id, 2, 2) 
      b2.should_not be_nil
      b2.contents.should == "2.0"
      
      a2 = ExcelCell.find_cell(f.id, 1, 2)
      a2.should_not be_nil
      a2.contents.should == "B1+B2*B3"

      f.excel_cells.size.should_not == 0

      b1 = f.cell_at(2,1)
      b1.should_not be_nil
      b1.contents.should == "1.0"
      
      b2 = ExcelCell.find_cell(f.id, 2, 3) 
      b2.should_not be_nil
      b2.contents.should == "3.0"

    end
  end

  describe "loading an excel file twice" do
    it "should succeed" do
      @loader.load
      l2 = Loader.new(EXCEL_FILE_PATH)
      lambda {l2.load}.should_not raise_error
    end
  end




end

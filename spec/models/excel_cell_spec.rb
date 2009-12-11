require 'spec_helper'

describe ExcelCell do
  fixtures(:excel_cells)
  fixtures(:excel_files)

  before(:each) do
    @ef = excel_files(:one)
    @valid_attributes = {
      :contents => "value for contents",
      :row => 1,
      :column => 1,
      :excel_file_id => @ef
    }
  end

  it "should create a new instance given valid attributes" do
    ExcelCell.create!(@valid_attributes)
  end

  it "should not create a new instance given invalid attributes" do
    %w(excel_file_id contents row column).each {|attr|
      lambda do
        b = ExcelCell.create({attr => nil})
        b.errors.on(attr).should_not be_nil
      end.should_not change(ExcelCell, :count)
    }
  end

  it "should have a method find_cell" do
    ExcelCell.respond_to?('find_cell')
  end

  it "should find a cell A1 with contents 1" do
    c = ExcelCell.find_cell(@ef.id, 1,1)
    c.should_not be_nil
    c.contents.should == "1" 
  end

  it "should find a cell A2 with contents 13" do
    c = ExcelCell.find_cell(@ef, 1,2)
    c.should_not be_nil
    c.contents.should  == "13"
  end

end

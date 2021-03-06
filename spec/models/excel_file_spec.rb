require 'spec_helper'

describe ExcelFile do
  before(:each) do
    @valid_attributes = {
      :path => "value for path",
      :first_row => 1,
      :last_row => 5,
      :first_column => 1,
      :last_column => 10
    }
  end

  it "should create a new instance given valid attributes" do
    lambda {ExcelFile.create!(@valid_attributes)}.should change(ExcelFile, :count).by(1)
  end

  it "should evaluate values of cells" do
    l  = Loader.new(EXCEL_FILE_PATH)
    id = l.load
    ef = ExcelFile.find(id)
    ef.evaluate_cell(1,2).should == 7

    ef.evaluate_cell(2,1).should == 1.0
    ef.evaluate_cell(2,2).should == 2.0
    ef.evaluate_cell(2,10).should == 10.0

   end

  it "should not create a new instance given invalid attributes" do
    lambda do
      b = ExcelFile.create({:path => nil, :first_column => nil, :first_row => nil, 
                             :last_column => nil, :last_row => nil})
      b.errors.on(:path).should_not be_nil
      b.errors.on(:first_column).should_not be_nil
      b.errors.on(:first_row).should_not be_nil
      b.errors.on(:last_column).should_not be_nil
      b.errors.on(:last_row).should_not be_nil

    end.should_not change(ExcelFile, :count)
  end



end

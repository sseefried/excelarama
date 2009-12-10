require 'spec_helper'

describe Loader do
  before(:each) do 
    @loader = Loader.new("#{RAILS_ROOT}/spec/data/Simple.xlsx")
  end

  describe "being created" do
    it "should be created given a path" do
      @loader.should_not be_nil
    end
  end

  describe "loading an excel file" do
    it "should add the cells to the database" do
      @loader.load
      size =  Cell.find(:all).size
      size.should_not equal(0)
      
      b1 = Cell.find_cell("B", 1)
      b1.should_not be_nil
      b1.contents.should == "1.0"

      b2 = Cell.find_cell("B", 2) 
      b2.should_not be_nil
      b2.contents.should == "2.0"
      
      a2 = Cell.find_cell("A", 2)
      a2.should_not be_nil
      a2.contents.should == "SUM(B1:B10)"

    end
  end



end

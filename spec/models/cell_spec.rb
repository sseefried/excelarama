require 'spec_helper'

describe Cell do
  fixtures(:cells)

  before(:each) do
    @valid_attributes = {
      :contents => "value for contents",
      :row => 1,
      :column => "value for column"
    }
  end

  it "should create a new instance given valid attributes" do
    Cell.create!(@valid_attributes)
  end

  it "should not create a new instance given invalid attributes" do
    %w(contents row column).each {|attr|
      lambda do
        b = Cell.create({attr => nil})
        b.errors.on(attr).should_not be_nil
      end.should_not change(Cell, :count)
    }
  end

  it "should have a method find_cell" do
    Cell.respond_to?('find_cell')
  end

  it "should find a cell A1 with contents 1" do
    c = Cell.find_cell("A",1)
    c.should_not be_nil
    c.contents.should == "1" 
  end

  it "should find a cell A2 with contents 13" do
    c = Cell.find_cell("A",2)
    c.should_not be_nil
    c.contents.should  == "13"
  end

end

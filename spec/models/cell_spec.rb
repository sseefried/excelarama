require 'spec_helper'

describe Cell do
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

end

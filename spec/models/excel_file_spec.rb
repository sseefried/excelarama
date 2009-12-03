require 'spec_helper'

describe ExcelFile do
  before(:each) do
    @valid_attributes = {
      :path => "value for path"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda {ExcelFile.create!(@valid_attributes)}.should change(ExcelFile, :count).by(1)
  end

  it "should not create a new instance given invalid attributes" do
    lambda do
      b = ExcelFile.create({:path => nil})
      b.errors.on(:path).should_not be_nil
    end.should_not change(ExcelFile, :count)
  end

end

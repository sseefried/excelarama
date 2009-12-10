require 'spec_helper'

describe Loader do
  before(:each) do 
    @loader = Loader.new('some/path/file.xlsx')
  end

  describe "being created" do
    it "should be created given a path" do
      @loader.should_not be_nil
    end
  end

  describe "loading an excel file" do
    it "should add the cells to the database" do
      @loader.load
    end
  end



end

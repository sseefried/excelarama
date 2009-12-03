require 'spec_helper'

describe ExcelFilesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/excel_files" }.should route_to(:controller => "excel_files", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/excel_files/new" }.should route_to(:controller => "excel_files", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/excel_files/1" }.should route_to(:controller => "excel_files", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/excel_files/1/edit" }.should route_to(:controller => "excel_files", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/excel_files" }.should route_to(:controller => "excel_files", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/excel_files/1" }.should route_to(:controller => "excel_files", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/excel_files/1" }.should route_to(:controller => "excel_files", :action => "destroy", :id => "1") 
    end
  end
end

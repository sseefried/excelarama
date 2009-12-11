require 'spec_helper'

describe MainController do

  def mock_excel_file(stubs = {})
    @mock_excel_file ||= mock_model(ExcelFile, stubs)
  end
  
  #Delete this example and add some real ones
  it "should use MainController" do
    controller.should be_an_instance_of(MainController)
  end

  describe "GET index" do
    it "redirects to show" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns to @excel_file" do
      ExcelFile.stub!(:find).with("42").and_return(mock_excel_file)
      get :show, :id => "42"
      assigns[:excel_file].should equal(mock_excel_file)
    end
  end

  describe "POST load" do
    it "should redirect to show" do
      post :load, :path => EXCEL_FILE_PATH
      response.should redirect_to(:action => 'show', :id => assigns[:excel_file_id])
    end
  end



end

require 'spec_helper'

describe MainController do

  #Delete this example and add some real ones
  it "should use MainController" do
    controller.should be_an_instance_of(MainController)
  end

  describe "GET index" do
    it "redirects to show" do
      get :index
      response.should redirect_to(:action => 'show')
    end
  end

  describe "GET show" do
    it "assigns cell data to @table" do
      get :show
    end
  end


end

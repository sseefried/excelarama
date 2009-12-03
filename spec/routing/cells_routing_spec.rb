require 'spec_helper'

describe CellsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/cells" }.should route_to(:controller => "cells", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cells/new" }.should route_to(:controller => "cells", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cells/1" }.should route_to(:controller => "cells", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cells/1/edit" }.should route_to(:controller => "cells", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cells" }.should route_to(:controller => "cells", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/cells/1" }.should route_to(:controller => "cells", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cells/1" }.should route_to(:controller => "cells", :action => "destroy", :id => "1") 
    end
  end
end

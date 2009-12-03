require 'spec_helper'

describe ExcelFilesController do

  def mock_excel_file(stubs={})
    @mock_excel_file ||= mock_model(ExcelFile, stubs)
  end

  describe "GET index" do
    it "assigns all excel_files as @excel_files" do
      ExcelFile.stub!(:find).with(:all).and_return([mock_excel_file])
      get :index
      assigns[:excel_files].should == [mock_excel_file]
    end
  end

  describe "GET show" do
    it "assigns the requested excel_file as @excel_file" do
      ExcelFile.stub!(:find).with("37").and_return(mock_excel_file)
      get :show, :id => "37"
      assigns[:excel_file].should equal(mock_excel_file)
    end
  end

  describe "GET new" do
    it "assigns a new excel_file as @excel_file" do
      ExcelFile.stub!(:new).and_return(mock_excel_file)
      get :new
      assigns[:excel_file].should equal(mock_excel_file)
    end
  end

  describe "GET edit" do
    it "assigns the requested excel_file as @excel_file" do
      ExcelFile.stub!(:find).with("37").and_return(mock_excel_file)
      get :edit, :id => "37"
      assigns[:excel_file].should equal(mock_excel_file)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created excel_file as @excel_file" do
        ExcelFile.stub!(:new).with({'these' => 'params'}).and_return(mock_excel_file(:save => true))
        post :create, :excel_file => {:these => 'params'}
        assigns[:excel_file].should equal(mock_excel_file)
      end

      it "redirects to the created excel_file" do
        ExcelFile.stub!(:new).and_return(mock_excel_file(:save => true))
        post :create, :excel_file => {}
        response.should redirect_to(excel_file_url(mock_excel_file))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved excel_file as @excel_file" do
        ExcelFile.stub!(:new).with({'these' => 'params'}).and_return(mock_excel_file(:save => false))
        post :create, :excel_file => {:these => 'params'}
        assigns[:excel_file].should equal(mock_excel_file)
      end

      it "re-renders the 'new' template" do
        ExcelFile.stub!(:new).and_return(mock_excel_file(:save => false))
        post :create, :excel_file => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested excel_file" do
        ExcelFile.should_receive(:find).with("37").and_return(mock_excel_file)
        mock_excel_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :excel_file => {:these => 'params'}
      end

      it "assigns the requested excel_file as @excel_file" do
        ExcelFile.stub!(:find).and_return(mock_excel_file(:update_attributes => true))
        put :update, :id => "1"
        assigns[:excel_file].should equal(mock_excel_file)
      end

      it "redirects to the excel_file" do
        ExcelFile.stub!(:find).and_return(mock_excel_file(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(excel_file_url(mock_excel_file))
      end
    end

    describe "with invalid params" do
      it "updates the requested excel_file" do
        ExcelFile.should_receive(:find).with("37").and_return(mock_excel_file)
        mock_excel_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :excel_file => {:these => 'params'}
      end

      it "assigns the excel_file as @excel_file" do
        ExcelFile.stub!(:find).and_return(mock_excel_file(:update_attributes => false))
        put :update, :id => "1"
        assigns[:excel_file].should equal(mock_excel_file)
      end

      it "re-renders the 'edit' template" do
        ExcelFile.stub!(:find).and_return(mock_excel_file(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested excel_file" do
      ExcelFile.should_receive(:find).with("37").and_return(mock_excel_file)
      mock_excel_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the excel_files list" do
      ExcelFile.stub!(:find).and_return(mock_excel_file(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(excel_files_url)
    end
  end

end

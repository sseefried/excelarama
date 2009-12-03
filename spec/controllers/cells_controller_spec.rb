require 'spec_helper'

describe CellsController do

  def mock_cell(stubs={})
    @mock_cell ||= mock_model(Cell, stubs)
  end

  describe "GET index" do
    it "assigns all cells as @cells" do
      Cell.stub!(:find).with(:all).and_return([mock_cell])
      get :index
      assigns[:cells].should == [mock_cell]
    end
  end

  describe "GET show" do
    it "assigns the requested cell as @cell" do
      Cell.stub!(:find).with("37").and_return(mock_cell)
      get :show, :id => "37"
      assigns[:cell].should equal(mock_cell)
    end
  end

  describe "GET new" do
    it "assigns a new cell as @cell" do
      Cell.stub!(:new).and_return(mock_cell)
      get :new
      assigns[:cell].should equal(mock_cell)
    end
  end

  describe "GET edit" do
    it "assigns the requested cell as @cell" do
      Cell.stub!(:find).with("37").and_return(mock_cell)
      get :edit, :id => "37"
      assigns[:cell].should equal(mock_cell)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cell as @cell" do
        Cell.stub!(:new).with({'these' => 'params'}).and_return(mock_cell(:save => true))
        post :create, :cell => {:these => 'params'}
        assigns[:cell].should equal(mock_cell)
      end

      it "redirects to the created cell" do
        Cell.stub!(:new).and_return(mock_cell(:save => true))
        post :create, :cell => {}
        response.should redirect_to(cell_url(mock_cell))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cell as @cell" do
        Cell.stub!(:new).with({'these' => 'params'}).and_return(mock_cell(:save => false))
        post :create, :cell => {:these => 'params'}
        assigns[:cell].should equal(mock_cell)
      end

      it "re-renders the 'new' template" do
        Cell.stub!(:new).and_return(mock_cell(:save => false))
        post :create, :cell => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cell" do
        Cell.should_receive(:find).with("37").and_return(mock_cell)
        mock_cell.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cell => {:these => 'params'}
      end

      it "assigns the requested cell as @cell" do
        Cell.stub!(:find).and_return(mock_cell(:update_attributes => true))
        put :update, :id => "1"
        assigns[:cell].should equal(mock_cell)
      end

      it "redirects to the cell" do
        Cell.stub!(:find).and_return(mock_cell(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cell_url(mock_cell))
      end
    end

    describe "with invalid params" do
      it "updates the requested cell" do
        Cell.should_receive(:find).with("37").and_return(mock_cell)
        mock_cell.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cell => {:these => 'params'}
      end

      it "assigns the cell as @cell" do
        Cell.stub!(:find).and_return(mock_cell(:update_attributes => false))
        put :update, :id => "1"
        assigns[:cell].should equal(mock_cell)
      end

      it "re-renders the 'edit' template" do
        Cell.stub!(:find).and_return(mock_cell(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cell" do
      Cell.should_receive(:find).with("37").and_return(mock_cell)
      mock_cell.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cells list" do
      Cell.stub!(:find).and_return(mock_cell(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cells_url)
    end
  end

end

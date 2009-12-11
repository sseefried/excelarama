class MainController < ApplicationController

  def index
    @path = params[:path]
  end

  def load
    begin
      l = Loader.new(params[:path])
      @excel_file_id = l.load
      redirect_to({:action => 'show', :id => @excel_file_id})
    rescue
      flash[:notice] = "File `#{params[:path]}' does not exist"
      
      redirect_to :action => 'index', :path => params[:path]
    end
  end

  def show
    @excel_file = ExcelFile.find(params[:id])
  end

end

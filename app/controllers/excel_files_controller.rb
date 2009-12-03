class ExcelFilesController < ApplicationController
  # GET /excel_files
  # GET /excel_files.xml
  def index
    @excel_files = ExcelFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @excel_files }
    end
  end

  # GET /excel_files/1
  # GET /excel_files/1.xml
  def show
    @excel_file = ExcelFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @excel_file }
    end
  end

  # GET /excel_files/new
  # GET /excel_files/new.xml
  def new
    @excel_file = ExcelFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @excel_file }
    end
  end

  # GET /excel_files/1/edit
  def edit
    @excel_file = ExcelFile.find(params[:id])
  end

  # POST /excel_files
  # POST /excel_files.xml
  def create
    @excel_file = ExcelFile.new(params[:excel_file])

    respond_to do |format|
      if @excel_file.save
        flash[:notice] = 'ExcelFile was successfully created.'
        format.html { redirect_to(@excel_file) }
        format.xml  { render :xml => @excel_file, :status => :created, :location => @excel_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @excel_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /excel_files/1
  # PUT /excel_files/1.xml
  def update
    @excel_file = ExcelFile.find(params[:id])

    respond_to do |format|
      if @excel_file.update_attributes(params[:excel_file])
        flash[:notice] = 'ExcelFile was successfully updated.'
        format.html { redirect_to(@excel_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @excel_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /excel_files/1
  # DELETE /excel_files/1.xml
  def destroy
    @excel_file = ExcelFile.find(params[:id])
    @excel_file.destroy

    respond_to do |format|
      format.html { redirect_to(excel_files_url) }
      format.xml  { head :ok }
    end
  end
end

class CellsController < ApplicationController
  # GET /cells
  # GET /cells.xml
  def index
    @cells = Cell.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cells }
    end
  end

  # GET /cells/1
  # GET /cells/1.xml
  def show
    @cell = Cell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cell }
    end
  end

  # GET /cells/new
  # GET /cells/new.xml
  def new
    @cell = Cell.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cell }
    end
  end

  # GET /cells/1/edit
  def edit
    @cell = Cell.find(params[:id])
  end

  # POST /cells
  # POST /cells.xml
  def create
    @cell = Cell.new(params[:cell])

    respond_to do |format|
      if @cell.save
        flash[:notice] = 'Cell was successfully created.'
        format.html { redirect_to(@cell) }
        format.xml  { render :xml => @cell, :status => :created, :location => @cell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cells/1
  # PUT /cells/1.xml
  def update
    @cell = Cell.find(params[:id])

    respond_to do |format|
      if @cell.update_attributes(params[:cell])
        flash[:notice] = 'Cell was successfully updated.'
        format.html { redirect_to(@cell) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cells/1
  # DELETE /cells/1.xml
  def destroy
    @cell = Cell.find(params[:id])
    @cell.destroy

    respond_to do |format|
      format.html { redirect_to(cells_url) }
      format.xml  { head :ok }
    end
  end
end

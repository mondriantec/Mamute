class CartoriosController < ApplicationController

  # GET /cartorios
  # GET /cartorios.xml
  def index
    @cartorios = Cartorio.all.paginate(:page => params[:page], :per_page => 5)
    @cartorio = Cartorio.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cartorios }
    end
  end

  # GET /cartorios/1
  # GET /cartorios/1.xml
  def show
    @cartorio = Cartorio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cartorio }
    end
  end

  # GET /cartorios/new
  # GET /cartorios/new.xml
  def new
    @cartorio = Cartorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cartorio }
    end
  end

  # GET /cartorios/1/edit
  def edit
    @cartorio = Cartorio.find(params[:id])
  end

  # POST /cartorios
  # POST /cartorios.xml
  def create
    @cartorio = Cartorio.new(params[:cartorio])

    respond_to do |format|
      if @cartorio.save
        flash[:notice] = 'Cartorio was successfully created.'
        format.html { redirect_to(@cartorio) }
        format.xml  { render :xml => @cartorio, :status => :created, :location => @cartorio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cartorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cartorios/1
  # PUT /cartorios/1.xml
  def update
    @cartorio = Cartorio.find(params[:id])

    respond_to do |format|
      if @cartorio.update_attributes(params[:cartorio])
        flash[:notice] = 'Cartorio was successfully updated.'
        format.html { redirect_to(@cartorio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cartorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cartorios/1
  # DELETE /cartorios/1.xml
  def destroy
    @cartorio = Cartorio.find(params[:id])
    @cartorio.destroy

    respond_to do |format|
      format.html { redirect_to(cartorios_url) }
      format.xml  { head :ok }
    end
  end
end

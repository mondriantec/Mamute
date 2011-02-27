class SelosController < ApplicationController
  # GET /selos
  # GET /selos.xml
  def index
    @selos = Selo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @selos }
    end
  end

  # GET /selos/1
  # GET /selos/1.xml
  def show
    @selo = Selo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @selo }
    end
  end

  # GET /selos/new
  # GET /selos/new.xml
  def new
    @selo = Selo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @selo }
    end
  end

  # GET /selos/1/edit
  def edit
    @selo = Selo.find(params[:id])
  end

  # POST /selos
  # POST /selos.xml
  def create
    @selo = Selo.new(params[:selo])

    respond_to do |format|
      if @selo.save
        flash[:notice] = 'Selo was successfully created.'
        format.html { redirect_to(@selo) }
        format.xml  { render :xml => @selo, :status => :created, :location => @selo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @selo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /selos/1
  # PUT /selos/1.xml
  def update
    @selo = Selo.find(params[:id])

    respond_to do |format|
      if @selo.update_attributes(params[:selo])
        flash[:notice] = 'Selo was successfully updated.'
        format.html { redirect_to(@selo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @selo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /selos/1
  # DELETE /selos/1.xml
  def destroy
    @selo = Selo.find(params[:id])
    @selo.destroy

    respond_to do |format|
      format.html { redirect_to(selos_url) }
      format.xml  { head :ok }
    end
  end
end

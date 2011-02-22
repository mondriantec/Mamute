class TribunaisController < ApplicationController
  # GET /tribunais
  # GET /tribunais.xml
  def index
    @tribunais = Tribunal.all.paginate(:page => params[:page], :per_page => 5)
    @tribunal = Tribunal.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tribunais }
    end
  end

  # GET /tribunais/1
  # GET /tribunais/1.xml
  def show
    @tribunal = Tribunal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tribunal }
    end
  end

  # GET /tribunais/new
  # GET /tribunais/new.xml
  def new
    @tribunal = Tribunal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tribunal }
    end
  end

  # GET /tribunais/1/edit
  def edit
    @tribunal = Tribunal.find(params[:id])
  end

  # POST /tribunais
  # POST /tribunais.xml
  def create
    @tribunal = Tribunal.new(params[:tribunal])

    respond_to do |format|
      if @tribunal.save
        flash[:notice] = 'Tribunal was successfully created.'
        format.html { redirect_to(@tribunal) }
        format.xml  { render :xml => @tribunal, :status => :created, :location => @tribunal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tribunal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tribunais/1
  # PUT /tribunais/1.xml
  def update
    @tribunal = Tribunal.find(params[:id])

    respond_to do |format|
      if @tribunal.update_attributes(params[:tribunal])
        flash[:notice] = 'Tribunal was successfully updated.'
        format.html { redirect_to(@tribunal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tribunal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tribunais/1
  # DELETE /tribunais/1.xml
  def destroy
    @tribunal = Tribunal.find(params[:id])
    @tribunal.destroy

    respond_to do |format|
      format.html { redirect_to(tribunais_url) }
      format.xml  { head :ok }
    end
  end
end

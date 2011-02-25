class ConveniadosController < ApplicationController
  # GET /conveniados
  # GET /conveniados.xml
  def index
    @conveniados = Conveniado.all.paginate(:page => params[:page], :per_page => 5)
    @conveniado = Conveniado.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conveniados }
    end
  end

  # GET /conveniados/1
  # GET /conveniados/1.xml
  def show
    @conveniado = Conveniado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conveniado }
    end
  end

  # GET /conveniados/new
  # GET /conveniados/new.xml
  def new
    @conveniado = Conveniado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conveniado }
    end
  end

  # GET /conveniados/1/edit
  def edit
    @conveniado = Conveniado.find(params[:id])
  end

  # POST /conveniados
  # POST /conveniados.xml
  def create
    @conveniado = Conveniado.new(params[:conveniado])
    

    respond_to do |format|
      if @conveniado.save
        flash[:notice] = 'Conveniado was successfully created.'
        format.html { redirect_to(@conveniado) }
        format.xml  { render :xml => @conveniado, :status => :created, :location => @conveniado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @conveniado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conveniados/1
  # PUT /conveniados/1.xml
  def update
    @conveniado = Conveniado.find(params[:id])

    respond_to do |format|
      if @conveniado.update_attributes(params[:conveniado])
        flash[:notice] = 'Conveniado was successfully updated.'
        format.html { redirect_to(@conveniado) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conveniado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conveniados/1
  # DELETE /conveniados/1.xml
  def destroy
    @conveniado = Conveniado.find(params[:id])
    @conveniado.destroy

    respond_to do |format|
      format.html { redirect_to(conveniados_url) }
      format.xml  { head :ok }
    end
  end
end

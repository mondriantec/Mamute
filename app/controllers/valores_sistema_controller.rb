class ValoresSistemaController < ApplicationController
  # GET /valores_sistema
  # GET /valores_sistema.xml
  def index
    @valores_sistema = ValorSistema.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @valores_sistema }
    end
  end

  # GET /valores_sistema/1
  # GET /valores_sistema/1.xml
  def show
    @valor_sistema = ValorSistema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @valor_sistema }
    end
  end

  # GET /valores_sistema/new
  # GET /valores_sistema/new.xml
  def new
    @valor_sistema = ValorSistema.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @valor_sistema }
    end
  end

  # GET /valores_sistema/1/edit
  def edit
    @valor_sistema = ValorSistema.find(params[:id])
  end

  # POST /valores_sistema
  # POST /valores_sistema.xml
  def create
    @valor_sistema = ValorSistema.new(params[:valor_sistema])

    respond_to do |format|
      if @valor_sistema.save
        flash[:notice] = 'ValorSistema was successfully created.'
        format.html { redirect_to(@valor_sistema) }
        format.xml  { render :xml => @valor_sistema, :status => :created, :location => @valor_sistema }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @valor_sistema.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /valores_sistema/1
  # PUT /valores_sistema/1.xml
  def update
    @valor_sistema = ValorSistema.find(params[:id])

    respond_to do |format|
      if @valor_sistema.update_attributes(params[:valor_sistema])
        flash[:notice] = 'ValorSistema was successfully updated.'
        format.html { redirect_to(@valor_sistema) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @valor_sistema.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /valores_sistema/1
  # DELETE /valores_sistema/1.xml
  def destroy
    @valor_sistema = ValorSistema.find(params[:id])
    @valor_sistema.destroy

    respond_to do |format|
      format.html { redirect_to(valores_sistema_url) }
      format.xml  { head :ok }
    end
  end
end

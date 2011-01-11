class TipoCamposController < ApplicationController

  before_filter { |f| f.menu 'administracao' }

  # GET /tipo_campos
  # GET /tipo_campos.xml
  def index
    @tipo_campos = TipoCampo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_campos }
    end
  end

  # GET /tipo_campos/1
  # GET /tipo_campos/1.xml
  def show
    @tipo_campo = TipoCampo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_campo }
    end
  end

  # GET /tipo_campos/new
  # GET /tipo_campos/new.xml
  def new
    @tipo_campo = TipoCampo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_campo }
    end
  end

  # GET /tipo_campos/1/edit
  def edit
    @tipo_campo = TipoCampo.find(params[:id])
  end

  # POST /tipo_campos
  # POST /tipo_campos.xml
  def create
    @tipo_campo = TipoCampo.new(params[:tipo_campo])

    respond_to do |format|
      if @tipo_campo.save
        flash[:notice] = 'TipoCampo was successfully created.'
        format.html { redirect_to(@tipo_campo) }
        format.xml  { render :xml => @tipo_campo, :status => :created, :location => @tipo_campo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_campo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_campos/1
  # PUT /tipo_campos/1.xml
  def update
    @tipo_campo = TipoCampo.find(params[:id])

    respond_to do |format|
      if @tipo_campo.update_attributes(params[:tipo_campo])
        flash[:notice] = 'TipoCampo was successfully updated.'
        format.html { redirect_to(@tipo_campo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_campo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_campos/1
  # DELETE /tipo_campos/1.xml
  def destroy
    @tipo_campo = TipoCampo.find(params[:id])
    @tipo_campo.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_campos_url) }
      format.xml  { head :ok }
    end
  end
end

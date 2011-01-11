class TipoProcessosController < ApplicationController

  before_filter { |f| f.menu 'administracao' }

  # GET /tipo_processos
  # GET /tipo_processos.xml
  def index
    @tipo_processos = TipoProcesso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_processos }
    end
  end

  # GET /tipo_processos/1
  # GET /tipo_processos/1.xml
  def show
    @tipo_processo = TipoProcesso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_processo }
    end
  end

  # GET /tipo_processos/new
  # GET /tipo_processos/new.xml
  def new
    @tipo_processo = TipoProcesso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_processo }
    end
  end

  # GET /tipo_processos/1/edit
  def edit
    @tipo_processo = TipoProcesso.find(params[:id])
  end

  # POST /tipo_processos
  # POST /tipo_processos.xml
  def create
    @tipo_processo = TipoProcesso.new(params[:tipo_processo])

    respond_to do |format|
      if @tipo_processo.save
        flash[:notice] = 'TipoProcesso was successfully created.'
        format.html { redirect_to(@tipo_processo) }
        format.xml  { render :xml => @tipo_processo, :status => :created, :location => @tipo_processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_processos/1
  # PUT /tipo_processos/1.xml
  def update
    @tipo_processo = TipoProcesso.find(params[:id])

    respond_to do |format|
      if @tipo_processo.update_attributes(params[:tipo_processo])
        flash[:notice] = 'TipoProcesso was successfully updated.'
        format.html { redirect_to(@tipo_processo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_processos/1
  # DELETE /tipo_processos/1.xml
  def destroy
    @tipo_processo = TipoProcesso.find(params[:id])
    @tipo_processo.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_processos_url) }
      format.xml  { head :ok }
    end
  end
end

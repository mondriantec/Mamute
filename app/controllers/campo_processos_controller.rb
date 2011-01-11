class CampoProcessosController < ApplicationController

  before_filter { |f| f.menu 'administracao' }

  # GET /campo_processos
  # GET /campo_processos.xml
  def index
    @campo_processos = CampoProcesso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campo_processos }
    end
  end

  # GET /campo_processos/1
  # GET /campo_processos/1.xml
  def show
    @campo_processo = CampoProcesso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campo_processo }
    end
  end

  # GET /campo_processos/new
  # GET /campo_processos/new.xml
  def new
    @campo_processo = CampoProcesso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campo_processo }
    end
  end

  # GET /campo_processos/1/edit
  def edit
    @campo_processo = CampoProcesso.find(params[:id])
  end

  # POST /campo_processos
  # POST /campo_processos.xml
  def create
    @campo_processo = CampoProcesso.new(params[:campo_processo])

    respond_to do |format|
      if @campo_processo.save
        flash[:notice] = 'CampoProcesso was successfully created.'
        format.html { redirect_to(@campo_processo) }
        format.xml  { render :xml => @campo_processo, :status => :created, :location => @campo_processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campo_processos/1
  # PUT /campo_processos/1.xml
  def update
    @campo_processo = CampoProcesso.find(params[:id])

    respond_to do |format|
      if @campo_processo.update_attributes(params[:campo_processo])
        flash[:notice] = 'CampoProcesso was successfully updated.'
        format.html { redirect_to(@campo_processo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campo_processos/1
  # DELETE /campo_processos/1.xml
  def destroy
    @campo_processo = CampoProcesso.find(params[:id])
    @campo_processo.destroy

    respond_to do |format|
      format.html { redirect_to(campo_processos_url) }
      format.xml  { head :ok }
    end
  end
end

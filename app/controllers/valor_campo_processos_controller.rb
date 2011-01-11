class ValorCampoProcessosController < ApplicationController
  # GET /valor_campo_processos
  # GET /valor_campo_processos.xml
  def index
    @valor_campo_processos = ValorCampoProcesso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @valor_campo_processos }
    end
  end

  # GET /valor_campo_processos/1
  # GET /valor_campo_processos/1.xml
  def show
    @valor_campo_processo = ValorCampoProcesso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @valor_campo_processo }
    end
  end

  # GET /valor_campo_processos/new
  # GET /valor_campo_processos/new.xml
  def new
    @valor_campo_processo = ValorCampoProcesso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @valor_campo_processo }
    end
  end

  # GET /valor_campo_processos/1/edit
  def edit
    @valor_campo_processo = ValorCampoProcesso.find(params[:id])
  end

  # POST /valor_campo_processos
  # POST /valor_campo_processos.xml
  def create
    @valor_campo_processo = ValorCampoProcesso.new(params[:valor_campo_processo])

    respond_to do |format|
      if @valor_campo_processo.save
        flash[:notice] = 'ValorCampoProcesso was successfully created.'
        format.html { redirect_to(@valor_campo_processo) }
        format.xml  { render :xml => @valor_campo_processo, :status => :created, :location => @valor_campo_processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @valor_campo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /valor_campo_processos/1
  # PUT /valor_campo_processos/1.xml
  def update
    @valor_campo_processo = ValorCampoProcesso.find(params[:id])

    respond_to do |format|
      if @valor_campo_processo.update_attributes(params[:valor_campo_processo])
        flash[:notice] = 'ValorCampoProcesso was successfully updated.'
        format.html { redirect_to(@valor_campo_processo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @valor_campo_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_campo_processos/1
  # DELETE /valor_campo_processos/1.xml
  def destroy
    @valor_campo_processo = ValorCampoProcesso.find(params[:id])
    @valor_campo_processo.destroy

    respond_to do |format|
      format.html { redirect_to(valor_campo_processos_url) }
      format.xml  { head :ok }
    end
  end
end

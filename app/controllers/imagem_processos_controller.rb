class ImagemProcessosController < ApplicationController
  # GET /imagem_processos
  # GET /imagem_processos.xml
  def index
    @imagem_processos = ImagemProcesso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imagem_processos }
    end
  end

  # GET /imagem_processos/1
  # GET /imagem_processos/1.xml
  def show
    @imagem_processo = ImagemProcesso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @imagem_processo }
    end
  end

  # GET /imagem_processos/new
  # GET /imagem_processos/new.xml
  def new
    @imagem_processo = ImagemProcesso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imagem_processo }
    end
  end

  # GET /imagem_processos/1/edit
  def edit
    @imagem_processo = ImagemProcesso.find(params[:id])
  end

  # POST /imagem_processos
  # POST /imagem_processos.xml
  def create
    @imagem_processo = ImagemProcesso.new(params[:imagem_processo])

    respond_to do |format|
      if @imagem_processo.save
        flash[:notice] = 'ImagemProcesso was successfully created.'
        format.html { redirect_to(@imagem_processo) }
        format.xml  { render :xml => @imagem_processo, :status => :created, :location => @imagem_processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @imagem_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imagem_processos/1
  # PUT /imagem_processos/1.xml
  def update
    @imagem_processo = ImagemProcesso.find(params[:id])

    respond_to do |format|
      if @imagem_processo.update_attributes(params[:imagem_processo])
        flash[:notice] = 'ImagemProcesso was successfully updated.'
        format.html { redirect_to(@imagem_processo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imagem_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imagem_processos/1
  # DELETE /imagem_processos/1.xml
  def destroy
    @imagem_processo = ImagemProcesso.find(params[:id])
    @imagem_processo.destroy

    respond_to do |format|
      format.html { redirect_to(imagem_processos_url) }
      format.xml  { head :ok }
    end
  end
end

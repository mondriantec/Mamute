class ValorCampoDocumentosController < ApplicationController
  # GET /valor_campo_documentos
  # GET /valor_campo_documentos.xml
  def index
    @valor_campo_documentos = ValorCampoDocumento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @valor_campo_documentos }
    end
  end

  # GET /valor_campo_documentos/1
  # GET /valor_campo_documentos/1.xml
  def show
    @valor_campo_documento = ValorCampoDocumento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @valor_campo_documento }
    end
  end

  # GET /valor_campo_documentos/new
  # GET /valor_campo_documentos/new.xml
  def new
    @valor_campo_documento = ValorCampoDocumento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @valor_campo_documento }
    end
  end

  # GET /valor_campo_documentos/1/edit
  def edit
    @valor_campo_documento = ValorCampoDocumento.find(params[:id])
  end

  # POST /valor_campo_documentos
  # POST /valor_campo_documentos.xml
  def create
    @valor_campo_documento = ValorCampoDocumento.new(params[:valor_campo_documento])

    respond_to do |format|
      if @valor_campo_documento.save
        flash[:notice] = 'ValorCampoDocumento was successfully created.'
        format.html { redirect_to(@valor_campo_documento) }
        format.xml  { render :xml => @valor_campo_documento, :status => :created, :location => @valor_campo_documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @valor_campo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /valor_campo_documentos/1
  # PUT /valor_campo_documentos/1.xml
  def update
    @valor_campo_documento = ValorCampoDocumento.find(params[:id])

    respond_to do |format|
      if @valor_campo_documento.update_attributes(params[:valor_campo_documento])
        flash[:notice] = 'ValorCampoDocumento was successfully updated.'
        format.html { redirect_to(@valor_campo_documento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @valor_campo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_campo_documentos/1
  # DELETE /valor_campo_documentos/1.xml
  def destroy
    @valor_campo_documento = ValorCampoDocumento.find(params[:id])
    @valor_campo_documento.destroy

    respond_to do |format|
      format.html { redirect_to(valor_campo_documentos_url) }
      format.xml  { head :ok }
    end
  end
end

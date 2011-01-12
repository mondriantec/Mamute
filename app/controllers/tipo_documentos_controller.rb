class TipoDocumentosController < ApplicationController

  before_filter { |f| f.menu 'administracao' }

  # GET /tipo_documentos
  # GET /tipo_documentos.xml
  def index
    @tipo_documentos = TipoDocumento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_documentos }
    end
  end

  # GET /tipo_documentos/1
  # GET /tipo_documentos/1.xml
  def show
    @tipo_documento = TipoDocumento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_documento }
    end
  end

  # GET /tipo_documentos/new
  # GET /tipo_documentos/new.xml
  def new
    @tipo_documento = TipoDocumento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_documento }
    end
  end

  # GET /tipo_documentos/1/edit
  def edit
    @tipo_documento = TipoDocumento.find(params[:id])
  end

  # POST /tipo_documentos
  # POST /tipo_documentos.xml
  def create
    @tipo_documento = TipoDocumento.new(params[:tipo_documento])

    respond_to do |format|
      if @tipo_documento.save
        flash[:notice] = 'TipoDocumento was successfully created.'
        format.html { redirect_to(@tipo_documento) }
        format.xml  { render :xml => @tipo_documento, :status => :created, :location => @tipo_documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_documentos/1
  # PUT /tipo_documentos/1.xml
  def update
    @tipo_documento = TipoDocumento.find(params[:id])

    respond_to do |format|
      if @tipo_documento.update_attributes(params[:tipo_documento])
        flash[:notice] = 'TipoDocumento was successfully updated.'
        format.html { redirect_to(@tipo_documento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_documentos/1
  # DELETE /tipo_documentos/1.xml
  def destroy
    @tipo_documento = TipoDocumento.find(params[:id])
    @tipo_documento.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_documentos_url) }
      format.xml  { head :ok }
    end
  end
end

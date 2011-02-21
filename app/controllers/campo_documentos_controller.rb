class CampoDocumentosController < ApplicationController
  # GET /campo_documentos
  # GET /campo_documentos.xml
  def index
    @campo_documentos = CampoDocumento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campo_documentos }
    end
  end

  # GET /campo_documentos/1
  # GET /campo_documentos/1.xml
  def show
    @campo_documento = CampoDocumento.find(params[:id])
	
	  
    respond_to do |format|
      format.html { redirect_to(@campo_documento.tipo_documento) }
      format.xml  { render :xml => @campo_documento }
    end
  end

  # GET /campo_documentos/new
  # GET /campo_documentos/new.xml
  def new
    @campo_documento = CampoDocumento.new
    @campo_documento.tipo_documento_id = params[:id]    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campo_documento }
    end
  end

  # GET /campo_documentos/1/edit
  def edit
    @campo_documento = CampoDocumento.find(params[:id])
  end

  # POST /campo_documentos
  # POST /campo_documentos.xml
  def create
    @campo_documento = CampoDocumento.new(params[:campo_documento])

    respond_to do |format|
      if @campo_documento.save
        flash[:notice] = 'CampoDocumento was successfully created.'
        format.html { redirect_to(@campo_documento.tipo_documento) }
        format.xml  { render :xml => @campo_documento, :status => :created, :location => @campo_documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campo_documentos/1
  # PUT /campo_documentos/1.xml
  def update
    @campo_documento = CampoDocumento.find(params[:id])

    respond_to do |format|
      if @campo_documento.update_attributes(params[:campo_documento])
        flash[:notice] = 'CampoDocumento was successfully updated.'
        format.html { redirect_to(@campo_documento.tipo_documento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campo_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campo_documentos/1
  # DELETE /campo_documentos/1.xml
  def destroy
    @campo_documento = CampoDocumento.find(params[:id])
    @campo_documento.destroy

    respond_to do |format|
      format.html { redirect_to(@campo_documento.tipo_documento) }
      format.xml  { head :ok }
    end
  end
end

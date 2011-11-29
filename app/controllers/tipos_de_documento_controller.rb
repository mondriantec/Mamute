class TiposDeDocumentoController < ApplicationController
  # GET /tipos_de_documento
  # GET /tipos_de_documento.xml
  def index
    @tipos_de_documento = TipoDeDocumento.find(:all, :order => 'id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_de_documento }
    end
  end

  # GET /tipos_de_documento/1
  # GET /tipos_de_documento/1.xml
  def show
    @tipo_de_documento = TipoDeDocumento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_de_documento }
    end
  end

  # GET /tipos_de_documento/new
  # GET /tipos_de_documento/new.xml
  def new
    @tipo_de_documento = TipoDeDocumento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_de_documento }
    end
  end

  # GET /tipos_de_documento/1/edit
  def edit
    @tipo_de_documento = TipoDeDocumento.find(params[:id])
  end

  # POST /tipos_de_documento
  # POST /tipos_de_documento.xml
  def create
    @tipo_de_documento = TipoDeDocumento.new(params[:tipo_de_documento])

    respond_to do |format|
      if @tipo_de_documento.save
        format.html { redirect_to(@tipo_de_documento, :notice => 'Tipo de documento cadastrado com sucesso.') }
        format.xml  { render :xml => @tipo_de_documento, :status => :created, :location => @tipo_de_documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_de_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_de_documento/1
  # PUT /tipos_de_documento/1.xml
  def update
    @tipo_de_documento = TipoDeDocumento.find(params[:id])

    respond_to do |format|
      if @tipo_de_documento.update_attributes(params[:tipo_de_documento])
        format.html { redirect_to(@tipo_de_documento, :notice => 'Tipo de documento atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_de_documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_documento/1
  # DELETE /tipos_de_documento/1.xml
  def destroy
    @tipo_de_documento = TipoDeDocumento.find(params[:id])
    @tipo_de_documento.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_de_documento_url) }
      format.xml  { head :ok }
    end
  end
end

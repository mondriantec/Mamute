class DocumentosController < ApplicationController      
  
  def get_campos            
     @campos = CampoDocumento.find(:all, :order => "ordem", :conditions => ["tipo_documento_id=?",params[:id]])
     render :layout => false
  end
  
  # GET /documentos
  # GET /documentos.xml
  def index                    
    
    @documento = Documento.new
    @documentos = []
    if params[:tipo] and params[:tipo][:tipo_documento_id]
      @documentos = Documento.find_all_by_tipo_documento_id(params[:tipo][:tipo_documento_id]).paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documentos }
    end
  end

  # GET /documentos/1
  # GET /documentos/1.xml
  def show
    @documento = Documento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/new
  # GET /documentos/new.xml
  def new
    @documento = Documento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/1/edit
  def edit
    @documento = Documento.find(params[:id])
  end

  # POST /documentos
  # POST /documentos.xml
  def create                                           
    Documento.transaction do                                                   
      @documento = Documento.new(params[:documento])  
      @documento.save       
      params[:metadados].each do |k,v|
        @documento.valor_campo_documentos.create(:campo_documento_id => k, :valor => v)
      end 
    end
    respond_to do |format|
      if !@documento.new_record?
        flash[:notice] = 'Documento was successfully created.'
        format.html { redirect_to(@documento) }
        format.xml  { render :xml => @documento, :status => :created, :location => @documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documentos/1
  # PUT /documentos/1.xml
  def update
    @documento = Documento.find(params[:id])

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        flash[:notice] = 'Documento was successfully updated.'
        format.html { redirect_to(@documento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.xml
  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to(documentos_url) }
      format.xml  { head :ok }
    end
  end
end

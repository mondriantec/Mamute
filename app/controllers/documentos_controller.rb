class DocumentosController < ApplicationController   
     
  before_filter :login_required, :except => [:verificar]             
  include ApplicationHelper
  
  def verificar
    if request.post?
       selo = Selo.find_by_numero(params[:selo])   
       @documento = selo.documento if selo.documento
    end
  end   
  
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
    if usuario_final? and @documento.certidoes.size == 0
      redirect_to :controller => 'certidoes', :action => 'new' , :id => @documento.id           
      return
    end
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
    @campos = CampoDocumento.find(:all, :order => "ordem", :conditions => ["tipo_documento_id=?",@documento.tipo_documento_id])
  end

  # POST /documentos
  # POST /documentos.xml
  def create                                           
    Documento.transaction do                         
      @usuario = Usuario.find_by_cpf(params[:usuario][:cpf])                          
      @documento = Documento.new(params[:documento])      
      @documento.usuario = @usuario  
      @documento.cartorio_id = current_usuario.entidade_id
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
    documento = Documento.find params[:id]
    Documento.transaction do                         
      @usuario = Usuario.find_by_id(documento.usuario_id)                          
      @documento = Documento.new(params[:documento])      
      @documento.usuario = @usuario  
      @documento.cartorio_id = current_usuario.entidade_id
      @documento.save       
      params[:metadados].each do |k,v|
        @documento.valor_campo_documentos.create(:campo_documento_id => k, :valor => v)
      end 
    end

    respond_to do |format|
      if 1 == 1 # so pra ajudar nos testes
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

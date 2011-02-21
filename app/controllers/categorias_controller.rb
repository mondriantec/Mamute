class CategoriasController < ApplicationController
  before_filter :load_categorias, :only => [:new,:edit,:create,:update]
  
  before_filter { |f| f.menu 'administracao' }
  
  # GET /categorias
  # GET /categorias.xml
  def index
    @categorias = Categoria.find(:all, :conditions => "parent_id is null")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categorias }
    end
  end

  # GET /categorias/1
  # GET /categorias/1.xml
  def show
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categoria }
    end
  end

  # GET /categorias/new
  # GET /categorias/new.xml
  def new
    session[:voltar_para] = request.env['HTTP_REFERER'] 
    @categoria = Categoria.new
    if params[:id]
      @categoria.parent_id = params[:id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categoria }
    end
  end

  # GET /categorias/1/edit
  def edit
    session[:voltar_para] = request.env['HTTP_REFERER'] 
    @categoria = Categoria.find(params[:id])
    @categorias.delete(@categoria)  
  end

  # POST /categorias
  # POST /categorias.xml
  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        flash[:notice] = 'Categoria was successfully created.'
        format.html { redirect_to(session[:voltar_para]) }
        format.xml  { render :xml => @categoria, :status => :created, :location => @categoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categorias/1
  # PUT /categorias/1.xml
  def update
    @categoria = Categoria.find(params[:id])
    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        flash[:notice] = 'Categoria was successfully updated.'
        format.html { redirect_to(session[:voltar_para]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.xml
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to(categorias_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_categorias
    @categorias = Categoria.find(:all, :conditions => [], :order =>"nome").collect {|c| [c.nome, c.id]}
  end
end

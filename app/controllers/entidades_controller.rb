class EntidadesController < ApplicationController

  before_filter { |f| f.menu 'administracao' }
  # GET /entidades
  # GET /entidades.xml
  def index
    @entidades = Entidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entidades }
    end
  end

  # GET /entidades/1
  # GET /entidades/1.xml
  def show
    @entidade = Entidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entidade }
    end
  end

  # GET /entidades/new
  # GET /entidades/new.xml
  def new
    @entidade = Entidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entidade }
    end
  end

  # GET /entidades/1/edit
  def edit
    @entidade = Entidade.find(params[:id])
  end

  # POST /entidades
  # POST /entidades.xml
  def create
    @entidade = Entidade.new(params[:entidade])

    respond_to do |format|
      if @entidade.save
        flash[:notice] = 'Entidade was successfully created.'
        format.html { redirect_to(@entidade) }
        format.xml  { render :xml => @entidade, :status => :created, :location => @entidade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entidades/1
  # PUT /entidades/1.xml
  def update
    @entidade = Entidade.find(params[:id])

    respond_to do |format|
      if @entidade.update_attributes(params[:entidade])
        flash[:notice] = 'Entidade was successfully updated.'
        format.html { redirect_to(@entidade) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.xml
  def destroy
    @entidade = Entidade.find(params[:id])
    @entidade.destroy

    respond_to do |format|
      format.html { redirect_to(entidades_url) }
      format.xml  { head :ok }
    end
  end
end

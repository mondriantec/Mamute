class ConfiguracoesController < ApplicationController

  before_filter { |f| f.menu 'administracao' }
  # GET /configuracoes
  # GET /configuracoes.xml
  def index
    @configuracoes = Configuracao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @configuracoes }
    end
  end

  # GET /configuracoes/1
  # GET /configuracoes/1.xml
  def show
    @configuracao = Configuracao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @configuracao }
    end
  end

  # GET /configuracoes/new
  # GET /configuracoes/new.xml
  def new
    @configuracao = Configuracao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @configuracao }
    end
  end

  # GET /configuracoes/1/edit
  def edit
    @configuracao = Configuracao.find(params[:id])
  end

  # POST /configuracoes
  # POST /configuracoes.xml
  def create
    @configuracao = Configuracao.new(params[:configuracao])

    respond_to do |format|
      if @configuracao.save
        flash[:notice] = 'Configuracao was successfully created.'
        format.html { redirect_to(@configuracao) }
        format.xml  { render :xml => @configuracao, :status => :created, :location => @configuracao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @configuracao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /configuracoes/1
  # PUT /configuracoes/1.xml
  def update
    @configuracao = Configuracao.find(params[:id])

    respond_to do |format|
      if @configuracao.update_attributes(params[:configuracao])
        flash[:notice] = 'Configuracao was successfully updated.'
        format.html { redirect_to(@configuracao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @configuracao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /configuracoes/1
  # DELETE /configuracoes/1.xml
  def destroy
    @configuracao = Configuracao.find(params[:id])
    @configuracao.destroy

    respond_to do |format|
      format.html { redirect_to(configuracoes_url) }
      format.xml  { head :ok }
    end
  end
end

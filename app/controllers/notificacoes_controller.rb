class NotificacoesController < ApplicationController
  # GET /notificacoes
  # GET /notificacoes.xml
  def index
    @notificacoes = Notificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notificacoes }
    end
  end

  # GET /notificacoes/1
  # GET /notificacoes/1.xml
  def show
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notificacao }
    end
  end

  # GET /notificacoes/new
  # GET /notificacoes/new.xml
  def new
    @notificacao = Notificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notificacao }
    end
  end

  # GET /notificacoes/1/edit
  def edit
    @notificacao = Notificacao.find(params[:id])
  end

  # POST /notificacoes
  # POST /notificacoes.xml
  def create
    @notificacao = Notificacao.new(params[:notificacao])

    respond_to do |format|
      if @notificacao.save
        flash[:notice] = 'Notificacao was successfully created.'
        format.html { redirect_to(@notificacao) }
        format.xml  { render :xml => @notificacao, :status => :created, :location => @notificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notificacoes/1
  # PUT /notificacoes/1.xml
  def update
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      if @notificacao.update_attributes(params[:notificacao])
        flash[:notice] = 'Notificacao was successfully updated.'
        format.html { redirect_to(@notificacao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacoes/1
  # DELETE /notificacoes/1.xml
  def destroy
    @notificacao = Notificacao.find(params[:id])
    @notificacao.destroy

    respond_to do |format|
      format.html { redirect_to(notificacoes_url) }
      format.xml  { head :ok }
    end
  end
end
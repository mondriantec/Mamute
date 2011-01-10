class MensagensController < ApplicationController

  before_filter { |f| f.menu 'mensagens' }

  # GET /mensagens
  # GET /mensagens.xml
  def index
    @mensagens = Mensagem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mensagens }
    end
  end

  # GET /mensagens/1
  # GET /mensagens/1.xml
  def show
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mensagem }
    end
  end

  # GET /mensagens/new
  # GET /mensagens/new.xml
  def new
    @mensagem = Mensagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mensagem }
    end
  end

  # GET /mensagens/1/edit
  def edit
    @mensagem = Mensagem.find(params[:id])
  end

  # POST /mensagens
  # POST /mensagens.xml
  def create
    @mensagem = Mensagem.new(params[:mensagem])

    respond_to do |format|
      if @mensagem.save
        flash[:notice] = 'Mensagem was successfully created.'
        format.html { redirect_to(@mensagem) }
        format.xml  { render :xml => @mensagem, :status => :created, :location => @mensagem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mensagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mensagens/1
  # PUT /mensagens/1.xml
  def update
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      if @mensagem.update_attributes(params[:mensagem])
        flash[:notice] = 'Mensagem was successfully updated.'
        format.html { redirect_to(@mensagem) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mensagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1
  # DELETE /mensagens/1.xml
  def destroy
    @mensagem = Mensagem.find(params[:id])
    @mensagem.destroy

    respond_to do |format|
      format.html { redirect_to(mensagens_url) }
      format.xml  { head :ok }
    end
  end
end

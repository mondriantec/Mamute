class NoticacaosController < ApplicationController
  # GET /noticacaos
  # GET /noticacaos.xml
  def index
    @noticacaos = Noticacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @noticacaos }
    end
  end

  # GET /noticacaos/1
  # GET /noticacaos/1.xml
  def show
    @noticacao = Noticacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @noticacao }
    end
  end

  # GET /noticacaos/new
  # GET /noticacaos/new.xml
  def new
    @noticacao = Noticacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @noticacao }
    end
  end

  # GET /noticacaos/1/edit
  def edit
    @noticacao = Noticacao.find(params[:id])
  end

  # POST /noticacaos
  # POST /noticacaos.xml
  def create
    @noticacao = Noticacao.new(params[:noticacao])

    respond_to do |format|
      if @noticacao.save
        flash[:notice] = 'Noticacao was successfully created.'
        format.html { redirect_to(@noticacao) }
        format.xml  { render :xml => @noticacao, :status => :created, :location => @noticacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @noticacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /noticacaos/1
  # PUT /noticacaos/1.xml
  def update
    @noticacao = Noticacao.find(params[:id])

    respond_to do |format|
      if @noticacao.update_attributes(params[:noticacao])
        flash[:notice] = 'Noticacao was successfully updated.'
        format.html { redirect_to(@noticacao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @noticacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /noticacaos/1
  # DELETE /noticacaos/1.xml
  def destroy
    @noticacao = Noticacao.find(params[:id])
    @noticacao.destroy

    respond_to do |format|
      format.html { redirect_to(noticacaos_url) }
      format.xml  { head :ok }
    end
  end
end

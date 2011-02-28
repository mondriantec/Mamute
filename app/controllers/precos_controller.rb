class PrecosController < ApplicationController
  # GET /precos
  # GET /precos.xml
  def index
    @precos = Preco.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @precos }
    end
  end

  # GET /precos/1
  # GET /precos/1.xml
  def show
    @preco = Preco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @preco }
    end
  end

  # GET /precos/new
  # GET /precos/new.xml
  def new
    @preco = Preco.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preco }
    end
  end

  # GET /precos/1/edit
  def edit
    @preco = Preco.find(params[:id])
  end

  # POST /precos
  # POST /precos.xml
  def create
    @preco = Preco.new(params[:preco])

    respond_to do |format|
      if @preco.save
        flash[:notice] = 'Preco was successfully created.'
        format.html { redirect_to(@preco) }
        format.xml  { render :xml => @preco, :status => :created, :location => @preco }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /precos/1
  # PUT /precos/1.xml
  def update
    @preco = Preco.find(params[:id])

    respond_to do |format|
      if @preco.update_attributes(params[:preco])
        flash[:notice] = 'Preco was successfully updated.'
        format.html { redirect_to(@preco) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @preco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /precos/1
  # DELETE /precos/1.xml
  def destroy
    @preco = Preco.find(params[:id])
    @preco.destroy

    respond_to do |format|
      format.html { redirect_to(precos_url) }
      format.xml  { head :ok }
    end
  end
end

class DepositariosController < ApplicationController
  # GET /depositarios
  # GET /depositarios.xml
  def index
    @depositarios = Depositario.find(:all, :order => 'descricao')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @depositarios }
    end
  end

  # GET /depositarios/1
  # GET /depositarios/1.xml
  def show
    @depositario = Depositario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @depositario }
    end
  end

  # GET /depositarios/new
  # GET /depositarios/new.xml
  def new
    @depositario = Depositario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @depositario }
    end
  end

  # GET /depositarios/1/edit
  def edit
    @depositario = Depositario.find(params[:id])
  end

  # POST /depositarios
  # POST /depositarios.xml
  def create
    @depositario = Depositario.new(params[:depositario])

    respond_to do |format|
      if @depositario.save
        format.html { redirect_to(@depositario, :notice => 'Depositario cadastrado com sucesso.') }
        format.xml  { render :xml => @depositario, :status => :created, :location => @depositario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @depositario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /depositarios/1
  # PUT /depositarios/1.xml
  def update
    @depositario = Depositario.find(params[:id])

    respond_to do |format|
      if @depositario.update_attributes(params[:depositario])
        format.html { redirect_to(@depositario, :notice => 'Depositario atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @depositario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /depositarios/1
  # DELETE /depositarios/1.xml
  def destroy
    @depositario = Depositario.find(params[:id])
    @depositario.destroy

    respond_to do |format|
      format.html { redirect_to(depositarios_url) }
      format.xml  { head :ok }
    end
  end
end

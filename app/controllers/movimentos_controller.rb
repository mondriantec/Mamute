class MovimentosController < ApplicationController
  # GET /movimentos
  # GET /movimentos.xml

  before_filter :load_contas_correntes

  def contas_a_pagar
    @movimentos = Movimento.find(:all,:conditions => ["data_pagamento is null and entidade_id = ? and tipo_movimento = 'D'", current_usuario.entidade_id])
  end

  def contas_pagas
     #campos para o select
    @campos = []
    @campos << ["LANCAMENTO: NÚMERO" ,"LANCAMENTO"]
    @campos << ["DATA LANCAMENTO","DATA"]
    @campos << ["DATA PAGAMENTO" ,"DT_PAG"]
    @campos << ["VALOR" ,"VALOR"]


    if request.post?
      @monvimentos = []
      x = params[:busca].clone
      params[:busca] = params[:busca].gsub(/\./,'').gsub(/-/,'').gsub(/\//,'')
      if params[:tipo_busca] == "LANCAMENTO"
         @movimentos = Movimento.find(:all, :conditions => ["id = ? and data_pagamento is not null and entidade_id = ? and tipo_movimento = 'D'",params[:busca], current_usuario.entidade_id])
      elsif params[:tipo_busca] == "DATA"
         @movimentos = Movimento.find(:all, :conditions => ["data = ? and data_pagamento is not null and entidade_id = ? and tipo_movimento = 'D'",params[:busca].to_date, current_usuario.entidade_id])
      elsif params[:tipo_busca] == "DT_PAG"
         @movimentos = Movimento.find(:all, :conditions => ["data_pagamento = ? and data_pagamento is not null and entidade_id = ? and tipo_movimento = 'D'",params[:busca].to_date, current_usuario.entidade_id])
      elsif params[:tipo_busca] == "VALOR"
         @movimentos = Movimento.find(:all, :conditions => ["valor between ? and ? and data_pagamento is not null and entidade_id = ? and tipo_movimento = 'D'",(params[:busca].to_f - 1),(params[:busca].to_f + 1), current_usuario.entidade_id]) 
      end
    else
  	  	@movimentos = Movimento.find(:all, :limit => 10, :conditions => ["data_pagamento is not null and entidade_id = ? and tipo_movimento = 'D'", current_usuario.entidade_id])
    end  
  end

  def index
    begin
      @movimentos = Movimento.find(:all, :conditions => ["entidade_id = ?", current_usuario.entidade_id], :limit => 10)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @movimentos }
      end
    rescue ActiveRecord::RecordNotFound => erro
      flash[:error] = "Registro não encontrado"
      redirect_to :controller => "erros", :action => "index" 
    rescue => erro
      flash[:error] = "Ocorreu o seguinte erro: #{erro}"
      redirect_to :controller => "erros", :action => "index"
    end
  end

  # GET /movimentos/1
  # GET /movimentos/1.xml
  def show
    begin
      @movimento = Movimento.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @movimento }
      end
    rescue ActiveRecord::RecordNotFound => erro
      flash[:error] = "Registro não encontrado"
      redirect_to :controller => "erros", :action => "index" 
    rescue => erro
      flash[:error] = "Ocorreu o seguinte erro: #{erro}"
      redirect_to :controller => "erros", :action => "index"
    end
  end

  # GET /movimentos/new
  # GET /movimentos/new.xml
  def new
    @movimento = Movimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimento }
    end
  end

  # GET /movimentos/1/edit
  def edit
    begin
      @movimento = Movimento.find(params[:id])
    rescue ActiveRecord::RecordNotFound => erro
      flash[:error] = "Registro não encontrado"
      redirect_to :controller => "erros", :action => "index" 
    rescue => erro
      flash[:error] = "Ocorreu o seguinte erro: #{erro}"
      redirect_to :controller => "erros", :action => "index"
    end
  end

  # POST /movimentos
  # POST /movimentos.xml
  def create
    @movimento = Movimento.new(params[:movimento])
    @movimento.entidade_id = current_usuario.entidade_id
    @movimento.valor = params[:movimento][:valor].gsub(',','.')
    @movimento.created_by = current_usuario.id
    @movimento.updated_by = current_usuario.id
    @movimento.data_vencimento = @movimento.data_pagamento if current_usuario.entidade_id == 1
    respond_to do |format|
      if @movimento.save
        flash[:notice] = 'Movimento was successfully created.'
        format.html { redirect_to(@movimento) }
        format.xml  { render :xml => @movimento, :status => :created, :location => @movimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movimentos/1
  # PUT /movimentos/1.xml
  def update
    begin
      @movimento = Movimento.find(params[:id])

      params[:movimento][:valor] = params[:movimento][:valor].to_s.gsub(',','.').to_f
      @movimento.updated_by = current_usuario.id
      respond_to do |format|
        if @movimento.update_attributes(params[:movimento])
          flash[:notice] = 'Movimento atualizado com sucesso.'
          format.html { redirect_to(@movimento) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
        end
      end
    rescue ActiveRecord::RecordNotFound => erro
      flash[:error] = "Registro não encontrado"
      redirect_to :controller => "erros", :action => "index" 
    rescue => erro
      flash[:error] = "Ocorreu o seguinte erro: #{erro}"
      redirect_to :controller => "erros", :action => "index"
    end
  end

  # DELETE /movimentos/1
  # DELETE /movimentos/1.xml
  def destroy
    begin
      @movimento = Movimento.find(params[:id])

      @movimento.destroy

      respond_to do |format|
        format.html { redirect_to(movimentos_url) }
        format.xml  { head :ok }
      end
    rescue ActiveRecord::RecordNotFound => erro
      flash[:error] = "Registro não encontrado"
      redirect_to :controller => "erros", :action => "index" 
    rescue => erro
      flash[:error] = "Ocorreu o seguinte erro: #{erro}"
      redirect_to :controller => "erros", :action => "index"
    end
  end

  def sub_depositario
    @sub_depositarios = SubDepositario.find_all_by_depositario_id_and_status(params[:movimento_depositario_id],1)
    if @sub_depositarios
       render :layout => false
    else
       render :text => ''
    end
  end

  def load_contas_correntes
    @contas = [['','']]
    contas = ContaCorrente.find(:all, :conditions => ["status = 'A'"], :order => 'descricao')
    contas.each {|c| @contas << [c.descricao, c.id]}
  end
end

class PlanosDeContaController < ApplicationController
  before_filter :load_contas_mae, :load_tipos, :except => [:index, :destroy]  

  # GET /planos_de_conta
  # GET /planos_de_conta.xml
  def index
    @planos_de_conta = PlanoDeConta.find(:all, :conditions => ["entidade_id = ?", current_usuario.entidade_id], :order => 'codigo_conta')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planos_de_conta }
    end
  end

  # GET /planos_de_conta/1
  # GET /planos_de_conta/1.xml
  def show
    @plano_de_conta = PlanoDeConta.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plano_de_conta }
    end
  end

  # GET /planos_de_conta/new
  # GET /planos_de_conta/new.xml
  def new
    @plano_de_conta = PlanoDeConta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plano_de_conta }
    end
  end

  # GET /planos_de_conta/1/edit
  def edit
    @plano_de_conta = PlanoDeConta.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)
  end

  # POST /planos_de_conta
  # POST /planos_de_conta.xml
  def create
    @plano_de_conta = PlanoDeConta.new(params[:plano_de_conta])

    respond_to do |format|
      if @plano_de_conta.save
        format.html { redirect_to(@plano_de_conta, :notice => 'Plano de conta cadastrado com sucesso.') }
        format.xml  { render :xml => @plano_de_conta, :status => :created, :location => @plano_de_conta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plano_de_conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planos_de_conta/1
  # PUT /planos_de_conta/1.xml
  def update
    @plano_de_conta = PlanoDeConta.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)

    respond_to do |format|
      if @plano_de_conta.update_attributes(params[:plano_de_conta])
        format.html { redirect_to(@plano_de_conta, :notice => 'Plano de conta atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plano_de_conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planos_de_conta/1
  # DELETE /planos_de_conta/1.xml
  def destroy
    @plano_de_conta = PlanoDeConta.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)
    @plano_de_conta.destroy

    respond_to do |format|
      format.html { redirect_to(planos_de_conta_url) }
      format.xml  { head :ok }
    end
  end

  def load_contas_mae
     @contas_mae = [['Selecione uma conta', nil]]
     contas = PlanoDeConta.find(:all, :conditions => ["lancavel = false and entidade_id = ?", current_usuario.entidade_id], :order => 'codigo_conta')
     contas.each {|c| @contas_mae << [c.descricao, c.id]}
  end

 def load_tipos
   @tipos = [['Crédito','C'],['Débito','D']]
 end
end

class FinanceiroController < ApplicationController

  before_filter { |f| f.menu 'financeiro' }

  def index
  end
  
  def index_gerar_faturas
  end

  def conferencia_gerar_faturas
    con = ActiveRecord::Base.connection
    con.begin_db_transaction
    sql = "select * from fnc_gerar_faturas('#{params['data_inicio']}', '#{params['data_fim']}', '#{current_usuario.entidade.cidade.uf}', '#{Date.today.end_of_month}')"
    @resultado = con.execute(sql)
    con.commit_db_transaction
  end
end

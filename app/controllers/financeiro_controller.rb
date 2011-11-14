class FinanceiroController < ApplicationController

  before_filter { |f| f.menu 'financeiro' }

  def index
  end
  
  def index_gerar_faturas
  end

end

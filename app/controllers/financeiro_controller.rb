class FinanceiroController < ApplicationController

  before_filter { |f| f.menu 'financeiro' }

  def index
  end

end

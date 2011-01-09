class AdministracaoController < ApplicationController

  before_filter { |f| f.menu 'administracao' }
  def index
  end

end

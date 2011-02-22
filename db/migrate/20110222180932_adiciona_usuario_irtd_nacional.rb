class AdicionaUsuarioIrtdNacional < ActiveRecord::Migration
  def self.up
    i = Irtd.new
    i.nome = 'IRTDPJ-BR'
    i.nacional = true
    i.save
    i.usuarios.create(
		:login => 'usuario_irtdbr', 
		:nome => 'usuario_irtdbr',
		:password => '123456',
		:password_confirmation => '123456',
		:email => 'irtdpjbr@uol.com.br')

  end

  def self.down
    i = Irtd.find_by_nome('IRTDPJ-BR')
    i.usuarios.destroy_all
    i.destroy
  end
end

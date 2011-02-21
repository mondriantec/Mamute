class CadastraEntidades < ActiveRecord::Migration
  def self.up
    irtd = Irtd.new
    irtd.uf = 'CE'
    irtd.nome = 'IRTDPJ-CE'
    irtd.save!
    
    t = Tribunal.new
    t.uf = 'CE'
    t.nome = 'Tribunal de Justiça do Ceará'
    t.save!
    
    conveniado = Conveniado.new
    conveniado.nome = 'Tribunal de Contas do Estado do Ceará'
    conveniado.save!
    
    cidade = Cidade.new
    cidade.uf = 'CE'
    cidade.nome = 'Fortaleza'
    cidade.save!
    
    cartorio = Cartorio.new
    cartorio.cidade = cidade
    cartorio.oficio = '1o Oficio de Fortaleza'
    cartorio.tabeliao = '....'
    cartorio.save!
    
    u_irtd = Usuario.new
    u_irtd.login = u_irtd.nome = 'usuario_irtd'
    u_irtd.password = u_irtd.password_confirmation = '123456'
    u_irtd.email = 'usuario_irtd@uol.com.br'
    u_irtd.entidade = irtd
    u_irtd.save!
    
    u_conveniado = Usuario.new
    u_conveniado.login u_conveniado.nome = 'usuario_conveniado'
    u_conveniado.password = u_conveniado.password_confirmation = '123456'
    u_conveniado.email = 'usuario_conveniado@uol.com.br'
    u_conveniado.entidade = conveniado
    u_conveniado.save!
    
    
    u_tribunal = Usuario.new
    u_tribunal.login = u_tribunal.nome = 'usuario_tribunal'
    u_tribunal.password = u_tribunal.password_confirmation = '123456'
    u_tribunal.email = 'usuario_tribunal@uol.com.br'
    u_tribunal.entidade = t
    u_tribunal.save!
    
    u_cartorio = Usuario.new
    u_cartorio.login = u_cartorio.nome = 'usuario_cartorio'
    u_cartorio.password = u_cartorio.password_confirmation = '123456'
    u_cartorio.email = 'usuario_cartorio@uol.com.br'
    u_cartorio.entidade = cartorio
    u_cartorio.save!
    
  end

  def self.down
    Cidade.destroy_all
    Cartorio.destroy_all
    Conveniado.destroy_all
    Tribunal.destroy_all
    Irtd.destroy_all
    Usuario.find(:all,:conditions => "login != 'admin'").each { |u| u.destroy }
  end
end

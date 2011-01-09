class CreatePerfisUsuarios < ActiveRecord::Migration
  def self.up
    create_table :perfis_usuarios, :id => false do |t|
      t.integer :usuario_id
      t.integer :perfil_id

      t.timestamps
    end
    u = Usuario.find_by_login('admin')
    u.perfis << Perfil.find_by_nome('ADMIN')
    u.save
  end

  def self.down
    drop_table :perfis_usuarios
  end
end

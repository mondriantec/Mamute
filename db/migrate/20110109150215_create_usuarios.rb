class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table "usuarios", :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :nome,                      :limit => 100, :default => '', :null => true
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at
      t.integer :created_by
      t.integer :updated_by      
    end
    add_index :usuarios, :login, :unique => true
    u = Usuario.new
    u.nome = u.login = 'admin'
    u.email = 'coutinho@mondriantecnologia.com'
    u.password = u.password_confirmation = '123456'
    u.save
  end

  def self.down
    drop_table "usuarios"
  end
end

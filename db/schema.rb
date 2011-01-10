# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110110025047) do

  create_table "cartorios", :force => true do |t|
    t.integer  "cidade_id"
    t.string   "oficio"
    t.string   "tabeliao"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "fone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.string   "uf",         :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configuracoes", :force => true do |t|
    t.string   "chave"
    t.string   "valor"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entidades", :force => true do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivo_notificacaos", :force => true do |t|
    t.string   "motivo"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfis", :force => true do |t|
    t.string   "nome"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfis_usuarios", :id => false, :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "rg"
    t.string   "orgao_emissor_rg"
    t.string   "uf_emissor_rg"
    t.string   "cnh"
    t.string   "nome_mae"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade_id"
    t.string   "cep"
    t.string   "estado_civil"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "nome",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "organizacao_id"
    t.string   "organizacao_type"
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true
  add_index "usuarios", ["organizacao_type", "organizacao_id"], :name => "index_usuarios_on_organizacao_type_and_organizacao_id"

end
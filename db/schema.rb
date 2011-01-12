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

ActiveRecord::Schema.define(:version => 20110112175612) do

  create_table "campo_documentos", :force => true do |t|
    t.integer  "tipo_documento_id"
    t.integer  "tipo_campo_id"
    t.integer  "limite"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campo_processos", :force => true do |t|
    t.integer  "tipo_campo_id"
    t.integer  "tipo_processo_id"
    t.string   "nome"
    t.integer  "tamanho"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "documentos", :force => true do |t|
    t.integer  "tipo_documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_content_type"
    t.string   "imagem_file_name"
    t.integer  "imagem_file_size"
  end

  create_table "entidades", :force => true do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imagens", :force => true do |t|
    t.integer  "documento_id"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imagens", ["documento_id"], :name => "index_imagens_on_documento_id"

  create_table "mensagens", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "destinatario_id"
    t.string   "assunto"
    t.text     "texto"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mensagens", ["assunto"], :name => "index_mensagens_on_assunto"
  add_index "mensagens", ["destinatario_id"], :name => "index_mensagens_on_destinatario_id"
  add_index "mensagens", ["status"], :name => "index_mensagens_on_status"
  add_index "mensagens", ["usuario_id"], :name => "index_mensagens_on_usuario_id"

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

  create_table "pessoa_versions", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "version"
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

  add_index "pessoa_versions", ["pessoa_id"], :name => "index_pessoa_versions_on_pessoa_id"

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
    t.integer  "version"
  end

  add_index "pessoas", ["cidade_id"], :name => "index_pessoas_on_cidade_id"
  add_index "pessoas", ["cnh"], :name => "index_pessoas_on_cnh"
  add_index "pessoas", ["cpf"], :name => "index_pessoas_on_cpf"
  add_index "pessoas", ["nome"], :name => "index_pessoas_on_nome"
  add_index "pessoas", ["nome_mae"], :name => "index_pessoas_on_nome_mae"
  add_index "pessoas", ["rg"], :name => "index_pessoas_on_rg"

  create_table "processo_versions", :force => true do |t|
    t.integer  "processo_id"
    t.integer  "version"
    t.integer  "tipo_processo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "processo_versions", ["processo_id"], :name => "index_processo_versions_on_processo_id"

  create_table "processos", :force => true do |t|
    t.integer  "tipo_processo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
  end

  create_table "tipo_campos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_documentos", :force => true do |t|
    t.string   "tipo"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_processos", :force => true do |t|
    t.string   "tipo"
    t.text     "descricao"
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

  create_table "valor_campo_documentos", :force => true do |t|
    t.integer  "documento_id"
    t.integer  "campo_documento_id"
    t.text     "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valor_campo_processos", :force => true do |t|
    t.integer  "processo_id"
    t.integer  "campo_processo_id"
    t.text     "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

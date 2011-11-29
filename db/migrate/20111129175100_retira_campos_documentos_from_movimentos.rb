class RetiraCamposDocumentosFromMovimentos < ActiveRecord::Migration
  def self.up
      remove_column :movimentos, :documento_type
      remove_column :movimentos, :documento_id
  end

  def self.down
    add_column :movimentos, :documento_type, :string, :null => false
    add_column :movimentos, :documento_id, :integer
  end
end

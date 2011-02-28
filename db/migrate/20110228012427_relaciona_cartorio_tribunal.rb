class RelacionaCartorioTribunal < ActiveRecord::Migration
  def self.up  
    add_column :cartorios, :tribunal_id, :integer 
    add_index :cartorios, :tribunal_id
    t = Tribunal.first      
    Cartorio.all.each do |c|
      c.tribunal_id = t.id
      c.save
    end
  end

  def self.down                                       
    remove_column :cartorios, :tribunal_id
  end
end

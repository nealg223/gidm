class AddSaltToDoers < ActiveRecord::Migration
  def self.up
    add_column :doers, :salt, :string
  end

  def self.down
    remove_column :doers, :salt
  end
end

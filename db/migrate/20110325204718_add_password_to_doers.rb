class AddPasswordToDoers < ActiveRecord::Migration
  def self.up
    add_column :doers, :encrypted_password, :string
  end

  def self.down
    remove_column :doers, :encrypted_password
  end
end

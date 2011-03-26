class AddAdminToDoers < ActiveRecord::Migration
  def self.up
    add_column :doers, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :doers, :admin
  end
end

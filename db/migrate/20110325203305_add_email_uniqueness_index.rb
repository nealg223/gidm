class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :doers, :email, :unique => true
  end

  def self.down
    remove_index :doers, :email
  end
end

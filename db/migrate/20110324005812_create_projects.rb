class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :content
      t.integer  :doer_id
      
      t.timestamps
    end
    add_index :projects, :doer_id
  end

  def self.down
    drop_table :projects
  end
end

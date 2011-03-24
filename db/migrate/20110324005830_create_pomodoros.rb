class CreatePomodoros < ActiveRecord::Migration
  def self.up
    create_table :pomodoros do |t|
      t.string :state # look this up!
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pomodoros
  end
end
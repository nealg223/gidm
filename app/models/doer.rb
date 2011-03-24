class Doer < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :projects
  has_many :tasks,     :through => :projects
  has_many :pomodoros, :through => :tasks
end
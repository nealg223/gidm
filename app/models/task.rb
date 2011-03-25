# == Schema Information
# Schema version: 20110325204915
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  description :string(255)
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
  attr_accessible :description
  has_many        :pomodoros
end

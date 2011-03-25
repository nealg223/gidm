# == Schema Information
# Schema version: 20110325204915
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  doer_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  attr_accessible :title
  has_many        :tasks
end

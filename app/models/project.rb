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
  attr_accessible :content
  
  belongs_to      :doer
  has_many        :tasks
  
  validates       :content, :presence => true, :length => { :maximum => 40 }
  validates       :doer_id, :presence => true
  
  default_scope   :order => 'projects.created_at DESC'  
end

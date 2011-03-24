class Project < ActiveRecord::Base
  attr_accessible :title
  has_many   :tasks
end

class Task < ActiveRecord::Base
  attr_accessible :description
  has_many   :pomodoros
end

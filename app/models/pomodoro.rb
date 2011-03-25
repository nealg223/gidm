# == Schema Information
# Schema version: 20110325204915
#
# Table name: pomodoros
#
#  id         :integer         not null, primary key
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pomodoro < ActiveRecord::Base
  attr_reader :state
end

# define states=( states ) # => String.Nil
# maybe a boolean?
# def state? # => Boolean
# def time_remaining? # => integer

# ROLES = %w( admin author user )
# OR STATES = %w ( interval 1 interval 2 - basically replace roles with state in schedule spy) I want users to have multiple roles but I can only have one state. 
# assuming we have all the state methods then we will need a state mask. t.integer state mask (see db migrate for schedule spy)

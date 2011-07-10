class Vacancy < ActiveRecord::Base
  attr_accessible :title, :text, :active_unit
  
  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :text, :presence => true
end

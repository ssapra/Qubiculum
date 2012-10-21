class Department < ActiveRecord::Base
  attr_accessible :abrv
  
  has_many :courses
end

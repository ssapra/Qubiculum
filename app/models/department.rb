class Department < ActiveRecord::Base
  attr_accessible :abrv, :name
  
  has_many :courses
end
